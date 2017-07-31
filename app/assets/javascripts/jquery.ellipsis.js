(function ($) {

  // this is a binary search that operates via a function
  // func should return < 0 if it should search smaller values
  // func should return > 0 if it should search larger values
  // func should return = 0 if the exact value is found
  // Note: this function handles multiple matches and will return the last match
  // this returns -1 if no match is found
  function binarySearch(length, func) {
    let low = 0;
    let high = length - 1;
    let best = -1;
    let mid;

    while (low <= high) {
      mid = ~~((low + high) / 2); //~~ is a fast way to convert something to an int
      let result = func(mid);
      if (result < 0) {
        high = mid - 1;
      } else if (result > 0) {
        low = mid + 1;
      } else {
        best = mid;
        low = mid + 1;
      }
    }

    return best;
  }

  // setup handlers for events for show/hide
  $.each(["show", "toggleClass", "addClass", "removeClass"], function () {

    //get the old function, e.g. $.fn.show   or $.fn.hide
    let oldFn = $.fn[this];
    $.fn[this] = function () {

      // get the items that are currently hidden
      let hidden = this.find(":hidden").add(this.filter(":hidden"));

      // run the original function
      let result = oldFn.apply(this, arguments);

      // for all of the hidden elements that are now visible
      hidden.filter(":visible").each(function () {
        // trigger the show msg
        $(this).triggerHandler("show");
      });

      return result;
    };
  });

  // create the ellipsis function
  // when addTooltip = true, add a title attribute with the original text
  $.fn.ellipsis = function (addTooltip) {

    return this.each(function () {
      let el = $(this);

      if (el.is(":visible")) {

        if (el.css("overflow") === "hidden") {
          let content = el.html();
          let multiline = el.hasClass('multiline');
          let tempElement = $(this.cloneNode(true))
            .hide()
            .css('position', 'absolute')
            .css('overflow', 'visible')
            .width(multiline ? el.width() : 'auto')
            .height(multiline ? 'auto' : el.height())
          ;

          el.after(tempElement);

          let tooTallFunc = function () {
            return tempElement.height() > el.height();
          };

          let tooWideFunc = function () {
            return tempElement.width() > el.width();
          };

          let tooLongFunc = multiline ? tooTallFunc : tooWideFunc;

          // if the element is too long...
          if (tooLongFunc()) {

            let tooltipText = null;
            // if a tooltip was requested...
            if (addTooltip) {
              // trim leading/trailing whitespace
              // and consolidate internal whitespace to a single space
              tooltipText = $.trim(el.text()).replace(/\s\s+/g, ' ');
            }

            let originalContent = content;

            let createContentFunc = function (i) {
              content = originalContent.substr(0, i);
              tempElement.html(content + "…");
            };

            let searchFunc = function (i) {
              createContentFunc(i);
              if (tooLongFunc()) {
                return -1;
              }
              return 0;
            };

            let len = binarySearch(content.length - 1, searchFunc);

            createContentFunc(len);

            el.html(tempElement.html());

            // add the tooltip if appropriate
            if (tooltipText !== null) {
              el.attr('title', tooltipText);
            }
          }

          tempElement.remove();
        }
      }
      else {
        // if this isn't visible, then hook up the show event
        el.one('show', function () {
          $(this).ellipsis(addTooltip);
        });
      }
    });
  };

  // ellipsification for items with an ellipsis
  $(document).ready(function () {
    $('.ellipsis').ellipsis(true);
  });

}(jQuery));