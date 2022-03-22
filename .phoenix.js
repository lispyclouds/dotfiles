const topHalf = {
  left: 0,
  top: 0,
  right: 0,
  bottom: 0.05,
};

const setAppPosition = (app, relativeFrame, space) => {
  const mainWindow = app.mainWindow();
  const activeScreen = space.screens()[0];
  const screen = activeScreen.flippedVisibleFrame();
  const left = screen.x + relativeFrame.left * screen.width;
  const top = screen.y + relativeFrame.top * screen.height;
  const right = screen.x + screen.width - relativeFrame.right * screen.width;
  const bottom =
    screen.y + screen.height - relativeFrame.bottom * screen.height;

  mainWindow.setTopLeft({
    x: left,
    y: top,
  });

  mainWindow.setSize({
    width: right - left,
    height: bottom - top,
  });
};

const screenContainsPoint = (screen, point) => {
  const frame = screen.flippedFrame();

  return (
    point.x >= frame.x &&
    point.x <= frame.x + frame.width &&
    point.y >= frame.y &&
    point.y <= frame.y + frame.height
  );
};

const mouseSpace = () => {
  const mouseLocation = Mouse.location();
  const screen = Screen.all().find((s) =>
    screenContainsPoint(s, mouseLocation)
  );

  if (screen !== undefined) {
    return screen.currentSpace();
  }
};

const moveAppToActiveSpace = (app, followsMouse) => {
  const activeSpace = followsMouse ? mouseSpace() : Space.active();
  const mainWindow = app.mainWindow();

  if (activeSpace !== undefined) {
    mainWindow.spaces().forEach((space) => {
      space.removeWindows([mainWindow]);
    });

    activeSpace.addWindows([mainWindow]);
  }

  return activeSpace;
};

const osascript = (script) =>
  new Promise((resolve, reject) =>
    Task.run("/usr/bin/osascript", ["-e", script], (handler) =>
      handler.status === 0 ? resolve(handler) : reject(handler)
    )
  );

const startApp = async (appName) => {
  // https://github.com/kasper/phoenix/issues/209
  // basically a hack to get around this bug

  let app = App.get(appName);
  let opened = false;

  if (app !== undefined) {
    if (app.windows().length === 0) {
      await osascript(`tell application "${appName}"
        try
            reopen
        on error
          log "can not reopen the app"
          activate
        end
          end tell
        `);
      opened = true;
    }
  } else {
    await osascript(`tell application "${appName}"
            activate
          end tell
        `);

    app = App.get(appName);
    opened = true;
  }

  return [app, opened];
};

const guakeApp = ({
  key,
  modifiers,
  appName,
  position,
  followsMouse,
  hideOnBlur,
}) =>
  Key.on(key, modifiers, async () => {
    const [app, opened] = await startApp(appName, { focus: false });

    if (app !== undefined) {
      const space = moveAppToActiveSpace(app, followsMouse);

      setAppPosition(app, position, space);
      app.isActive() && !opened ? app.hide() : app.focus();

      if (hideOnBlur) {
        const identifier = Event.on("appDidActivate", (activatedApp) => {
          if (app.name() !== activatedApp.name()) {
            app.hide();
            Event.off(identifier);
          }
        });
      }
    }
  });

guakeApp({
  key: "space",
  modifiers: ["alt"],
  appName: "kitty",
  position: topHalf,
  followsMouse: true,
  hideOnBlur: true,
});
