#! /usr/bin/python
#-*- coding: utf-8 -*-

import sys
from PySide.QtCore import QUrl
from PySide.QtGui import QApplication
from PySide.QtDeclarative import QDeclarativeView

from xkcdModel import XkcdModel

app = QApplication(sys.argv)

view = QDeclarativeView()
context = view.rootContext()
context.setContextProperty('xkcdModel', XkcdModel())
view.setSource(QUrl('n900.qml'))
view.show()

sys.exit(app.exec_())
