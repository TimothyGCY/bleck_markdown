import 'package:bleck_markdown/src/css_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

const Color separatorColor = Color(0xFFD7DDE3);
const Border bottomLine = Border(
  bottom: BorderSide(
    width: 1,
    style: BorderStyle.solid,
    color: separatorColor,
  ),
);

Style _headline = Style(
  margin: const EdgeInsets.only(
    top: 24,
    bottom: 16,
  ),
  fontWeight: FontWeight.w600,
  lineHeight: const LineHeight(1.25),
);
Style _list = Style(
  margin: const EdgeInsets.symmetric(vertical: 0),
  padding: EdgeInsets.only(left: emToPx(2)),
);
Style _tableCell = Style(
  padding: const EdgeInsets.symmetric(
    vertical: 6,
    horizontal: 13,
  ),
  border: Border.all(
    width: 1,
    style: BorderStyle.solid,
    color: const Color(0xFFD0D7DE),
  ),
);

Map<String, Style> markdownStyle = {
  'h1': _headline.copyWith(
    margin: EdgeInsets.symmetric(
      horizontal: 0,
      vertical: emToPx(0.67),
    ),
    padding: EdgeInsets.only(bottom: emToPx(0.3)),
    fontSize: FontSize.em(2),
    border: bottomLine,
  ),
  'h2': _headline.copyWith(
    padding: EdgeInsets.only(bottom: emToPx(0.3)),
    fontSize: FontSize.em(1.5),
    border: bottomLine,
  ),
  'h3': _headline.copyWith(
    fontSize: FontSize.em(1.25),
  ),
  'h4': _headline.copyWith(
    fontSize: FontSize.em(1),
  ),
  'h5': _headline.copyWith(
    fontSize: FontSize.em(0.875),
  ),
  'h6': _headline.copyWith(
    fontSize: FontSize.em(0.85),
    color: const Color(0xFF57606A),
  ),
  'p': Style(
    margin: const EdgeInsets.only(
      top: 0,
      bottom: 10,
    ),
  ),
  'hr': Style(
    height: emToPx(0.25),
    padding: const EdgeInsets.all(0),
    margin: const EdgeInsets.symmetric(
      vertical: 24,
      horizontal: 0,
    ),
    backgroundColor: separatorColor,
  ),
  'blockquote': Style(
    margin: const EdgeInsets.only(top: 0, bottom: 16),
    padding: const EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 0,
    ),
    color: const Color(0xFF57606A),
    // border: Border(
    //   left: BorderSide(
    //     width: emToPx(0.25),
    //     style: BorderStyle.solid,
    //     color: separatorColor,
    //   ),
    // ),
  ),
  // 'blockquote>:first-child': Style(margin: const EdgeInsets.only(top: 0)),
  // 'blockquote>:last-child': Style(margin: const EdgeInsets.only(bottom: 0)),
  'dl': Style(
    padding: const EdgeInsets.all(0),
  ),
  'dt': Style(
    padding: const EdgeInsets.all(0),
    margin: const EdgeInsets.only(top: 16),
    fontSize: FontSize.em(1),
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600,
  ),
  'dd': Style(
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    margin: const EdgeInsets.only(bottom: 16),
  ),
  'ol': _list,
  'ol ol': _list.copyWith(
    listStyleType: ListStyleType.LOWER_ROMAN,
    margin: const EdgeInsets.symmetric(vertical: 0),
  ),
  'ol ul': _list.copyWith(
    margin: const EdgeInsets.symmetric(vertical: 0),
  ),
  'ol ol ol': _list.copyWith(listStyleType: ListStyleType.LOWER_ALPHA),
  'ol ul ol': _list.copyWith(listStyleType: ListStyleType.LOWER_ALPHA),
  'ul': _list,
  'ul ul': _list.copyWith(
    margin: const EdgeInsets.symmetric(vertical: 0),
  ),
  'ul ol': _list.copyWith(
    listStyleType: ListStyleType.LOWER_ROMAN,
    margin: const EdgeInsets.symmetric(vertical: 0),
  ),
  'ul ol ol': _list.copyWith(listStyleType: ListStyleType.LOWER_ALPHA),
  'ul ul ol': _list.copyWith(listStyleType: ListStyleType.LOWER_ALPHA),
  '.task-list-item': _list.copyWith(
    listStyleType: ListStyleType.NONE,
    padding: const EdgeInsets.all(0),
  ),
  'th': _tableCell.copyWith(
    fontWeight: FontWeight.w600,
    backgroundColor: const Color(0xFFF6F8FA),
  ),
  'td': _tableCell,
  'tr': Style(
    backgroundColor: Colors.white,
    border: const Border(
      top: BorderSide(
        width: 1,
        style: BorderStyle.solid,
        color: separatorColor,
      ),
    ),
  ),
  // 'pre': Style(
  //   lineHeight: LineHeight.em(1.45),
  //   fontSize: const FontSize(12),
  //   fontFamily: 'ui-monospace',
  // ),
  // 'code, p code': Style(
  //   padding: EdgeInsets.symmetric(
  //     vertical: emToPx(0.2),
  //     horizontal: emToPx(0.4),
  //   ),
  //   margin: const EdgeInsets.all(0),
  //   backgroundColor: const Color.fromARGB(31, 175, 184, 193),
  //   fontSize: const FontSize(12),
  //   fontFamily: 'ui-monospace',
  // ),
  // 'pre code': Style(
  //   display: Display.INLINE,
  //   padding: const EdgeInsets.all(0),
  //   margin: const EdgeInsets.all(0),
  //   backgroundColor: Colors.transparent,
  // ),
  'h1 code, h2 code, h3 code. h4 code, h5 code, h6 code': Style(
    padding: EdgeInsets.symmetric(
      vertical: 0,
      horizontal: emToPx(0.2),
    ),
  ),
};
