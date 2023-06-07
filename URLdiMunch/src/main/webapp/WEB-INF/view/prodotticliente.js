document.addEventListener("DOMContentLoaded", function() {
  const container = document.querySelector(".slider-container");
  const leftArrow = document.querySelector(".left-arrow");
  const rightArrow = document.querySelector(".right-arrow");

  let currentPosition = 0;
  const cardWidth = 320;
  const numCards = container.children.length;

  leftArrow.addEventListener("click", slideLeft);
  rightArrow.addEventListener("click", slideRight);

  function slideLeft() {
    currentPosition = Math.max(currentPosition - cardWidth, -((numCards - 1) * cardWidth));
    container.style.transform = `translateX(${currentPosition}px)`;
  }

  function slideRight() {
    currentPosition = Math.min(currentPosition + cardWidth, 0);
    container.style.transform = `translateX(${currentPosition}px)`;
  }
});
