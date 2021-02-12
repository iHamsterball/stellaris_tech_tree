let pos = { top: 0, left: 0, x: 0, y: 0 };
let chart = document.getElementById('tech-tree');

const mouseDownHandler = function (e) {
    pos = {
        // The current scroll
        left: chart.scrollLeft,
        top: chart.scrollTop,
        // Get the current mouse position
        x: e.clientX,
        y: e.clientY,
    };
    // Change cursor
    chart.style.cursor = 'grabbing';
    chart.addEventListener('mousemove', mouseMoveHandler);
    chart.addEventListener('mouseup', mouseUpHandler);
};

const mouseMoveHandler = function (e) {
    // How far the mouse has been moved
    const dx = e.clientX - pos.x;
    const dy = e.clientY - pos.y;

    // Scroll the element
    chart.scrollTop = pos.top - dy;
    chart.scrollLeft = pos.left - dx;
};

const mouseUpHandler = function () {
    // Restore cursor
    chart.style.cursor = 'auto';
    chart.removeEventListener('mousemove', mouseMoveHandler);
    chart.removeEventListener('mouseup', mouseUpHandler);
};
