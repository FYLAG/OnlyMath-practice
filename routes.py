"""
Routes and views for the bottle application.
"""

from bottle import route, view
from datetime import datetime

@route('/')
@route('/home')
@route('/index')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        title = "Главная страница",
        year = datetime.now().year
    )

@route('/authors')
@view('authors')
def authors():
    """Renders the authors page."""
    return dict(
        title = "Информация об авторах",
        year=datetime.now().year
    )

@route('/method-eul')
@view('method_eul')
def method_eul():
    """Renders the method eul page."""
    return dict(
        title = "Поиск Эйлерова цикла",
        year=datetime.now().year,
        image_path = "",
        result = "",
        matrixout = [""]
    )

@route('/method-fragments')
@view('method_fragments')
def method_fragments():
    """Renders the method fragments page."""
    return dict(
        title = "Нахождение заданного фрагмента в графе",
        year=datetime.now().year
    )

@route('/method-nodes-length')
@view('method_nodesLength')
def method_nodesLength():
    """Renders the method nodes length page."""
    return dict(
        title = "Поиск в графе вершин, имеющих наибольшее окружение",
        year=datetime.now().year,
        image="",
        levelout=0,
        matrixout=[""]
    )