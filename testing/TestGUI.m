function h = TestGUI
h = openfig('TestGUI_Layout');
handles = guihandles(h);

cnt = 1;

set(handles.button_add,'Callback',@cb_add);
set(handles.button_remove,'Callback',@cb_remove);

% set(handles.foofoo, 'Parent', handles.panel_candidates);
% panel_pos = get(handles.panel_candidates,'Position');

% name = plugin_crossCorrelation(handles.panel_candidates, options);
% name = plugin_intensityFiltering(handles.panel_candidates);

    function cb_add (hObj, event)
        listbox_entries = get(handles.listbox1,'String');
        if numel(listbox_entries) == 0
            set(handles.listbox1,'Value',1);
        end
        
        listbox_entries = [listbox_entries;{['String_',num2str(cnt)]}];
        set(handles.listbox1,'String',listbox_entries);
        cnt = cnt+1;
    end

    function cb_remove (hObj, event)
        selected_entry = get(handles.listbox1,'Value');
        listbox_entries = get(handles.listbox1,'String');
        
        % When listbox is empty, do nothing
        if numel(listbox_entries) == 0
           return; 
        end
        % When last selected item is deleted, select the one before it
        if selected_entry == numel(listbox_entries)
            set(handles.listbox1,'Value',selected_entry-1);
        end
        
        listbox_entries(selected_entry) = [];
        set(handles.listbox1,'String',listbox_entries);
        
    end

end