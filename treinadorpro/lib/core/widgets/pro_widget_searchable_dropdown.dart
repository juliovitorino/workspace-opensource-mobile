import 'package:flutter/material.dart';
import 'package:treinadorpro/core/data/models/iname.dart';
import 'package:treinadorpro/core/widgets/pro_widget_text_field_container.dart';
import 'package:treinadorpro/core/widgets/pro_widget_text_form_field.dart';

class ProWidgetSearchableDropdown<T extends IName> extends StatefulWidget {
  final List<T> items;
  final String? hintTextSearch;
  final String? hintTextItem;
  final Function(T?)? onChanged;
  final bool customTextInputAllowed;

  const ProWidgetSearchableDropdown({
    super.key,
    required this.items,
    this.hintTextSearch = 'Pesquisar...',
    this.onChanged,
    this.customTextInputAllowed = false,
    this.hintTextItem = 'Selecione um item',
  });

  @override
  State<ProWidgetSearchableDropdown<T>> createState() =>
      _ProWidgetSearchableDropdownState();
}

class _ProWidgetSearchableDropdownState<T extends IName>
    extends State<ProWidgetSearchableDropdown<T>> {
  final TextEditingController _searchTextEditingController = TextEditingController();
  final TextEditingController _customTextEditingController =
      TextEditingController();

  List<T> _filteredItems = [];
  T? _selectedItem;
  bool _isSeachableItem = false;
  bool _isShowCustomTextInput = false;
  bool _isShowItemToSelect = true;

  @override
  void initState() {
    super.initState();
    _initFilteredItems();
    // _filteredItems = List.from(widget.items);
    _filteredItems.sort((a, b) => a.getName().compareTo(b.getName()));
    _searchTextEditingController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchTextEditingController.dispose();
    super.dispose();
  }

  void _initFilteredItems() {
    _filteredItems = List.from(widget.items);
  }

  void _onSearchChanged() {
    setState(() {
      if (_searchTextEditingController.text.isEmpty) {
        _filteredItems = List.from(widget.items);
      } else {
        _filteredItems = widget.items
            .where(
              (item) => item.getName().toLowerCase().contains(
                _searchTextEditingController.text.toLowerCase(),
              ),
            )
            .toList();
        // print('Itens filtrados = $_filteredItems');
      }
      _filteredItems.sort((a, b) => a.getName().compareTo(b.getName()));
    });
  }

  void _clearTextInput() {
    _searchTextEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        // TextInput for searchable item
        if (_isSeachableItem)
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchTextEditingController,
                  decoration: InputDecoration(
                    hintText: widget.hintTextSearch,
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.backspace),
                onPressed: _clearTextInput,
              ),
            ],
          ),

        // Item to select
        const SizedBox(height: 10),
        if(_isShowItemToSelect)
          Row(
          children: [
            Expanded(
              child: DropdownButton<T>(
                isExpanded: true,
                value: _selectedItem,
                hint: Text(widget.hintTextItem!),
                onChanged: (T? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                    _isSeachableItem = false;
                    if (widget.onChanged != null) {
                      widget.onChanged!(newValue);
                    }
                  });
                },
                items: _filteredItems.map<DropdownMenuItem<T>>((T item) {
                  return DropdownMenuItem<T>(
                    value: item,
                    child: Text(item.getName()),
                  );
                }).toList(),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () =>
                  setState(() {
                    _isSeachableItem = !_isSeachableItem;
                    _searchTextEditingController.clear();
                    _selectedItem = null;
                  }),
            ),
            if(widget.customTextInputAllowed)
              IconButton(
                  onPressed: () => setState(() {
                    _isSeachableItem = false;
                    _isShowItemToSelect = false;
                    _isShowCustomTextInput = true;
                  }),
                  icon: const Icon(Icons.edit)
              ),
          ],
        ),

        // Custom Text Input
        if(_isShowCustomTextInput && widget.customTextInputAllowed)
          Row(
            children: [
              Expanded(
                child: ProWidgetTextFormField(
                  controller: _customTextEditingController,
                  label: 'Exercício Personalizado',

                ),
              ),

              // clear button
              IconButton(
                  onPressed: () => setState(() {
                    _customTextEditingController.clear();
                  }),
                  icon: const Icon(Icons.backspace)
              ),

              // close buttonr
              IconButton(
                  onPressed: () => setState(() {
                    _isSeachableItem = false;
                    _isShowCustomTextInput = false;
                    _isShowItemToSelect = true;
                  }),
                  icon: const Icon(Icons.close)
              ),
            ],
          ),

      ],
    );
  }
}
