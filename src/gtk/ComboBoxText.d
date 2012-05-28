/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * inFile  = GtkComboBoxText.html
 * outPack = gtk
 * outFile = ComboBoxText
 * strct   = GtkComboBoxText
 * realStrct=
 * ctorStrct=
 * clss    = ComboBoxText
 * interf  = 
 * class Code: Yes
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- gtk_combo_box_text_
 * omit structs:
 * omit prefixes:
 * omit code:
 * 	- gtk_combo_box_text_new
 * 	- gtk_combo_box_text_new_with_entry
 * omit signals:
 * imports:
 * 	- glib.Str
 * 	- gtk.TreeIter
 * 	- gtk.TreeModelIF
 * structWrap:
 * module aliases:
 * local aliases:
 * overrides:
 * 	- removeAll
 */

module gtk.ComboBoxText;

public  import gtkc.gtktypes;

private import gtkc.gtk;
private import glib.ConstructionException;


private import glib.Str;
private import gtk.TreeIter;
private import gtk.TreeModelIF;



private import gtk.ComboBox;

/**
 * Description
 * A GtkComboBoxText is a simple variant of GtkComboBox that hides
 * the model-view complexity for simple text-only use cases.
 * To create a GtkComboBoxText, use gtk_combo_box_text_new() or
 * gtk_combo_box_text_new_with_entry().
 * You can add items to a GtkComboBoxText with
 * gtk_combo_box_text_append_text(), gtk_combo_box_text_insert_text()
 * or gtk_combo_box_text_prepend_text() and remove options with
 * gtk_combo_box_text_remove().
 * If the GtkComboBoxText contains an entry (via the 'has-entry' property),
 * its contents can be retrieved using gtk_combo_box_text_get_active_text().
 * The entry itself can be accessed by calling gtk_bin_get_child() on the
 * combo box.
 * GtkComboBoxText as GtkBuildable
 * The GtkComboBoxText implementation of the GtkBuildable interface
 * supports adding items directly using the <itemsgt element
 * and specifying <itemgt elements for each item. Each <itemgt
 * element supports the regular translation attributes "translatable",
 * "context" and "comments".
 * $(DDOC_COMMENT example)
 */
public class ComboBoxText : ComboBox
{
	
	/** the main Gtk struct */
	protected GtkComboBoxText* gtkComboBoxText;
	
	
	public GtkComboBoxText* getComboBoxTextStruct()
	{
		return gtkComboBoxText;
	}
	
	
	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkComboBoxText;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkComboBoxText* gtkComboBoxText)
	{
		if(gtkComboBoxText is null)
		{
			this = null;
			return;
		}
		//Check if there already is a D object for this gtk struct
		void* ptr = getDObject(cast(GObject*)gtkComboBoxText);
		if( ptr !is null )
		{
			this = cast(ComboBoxText)ptr;
			return;
		}
		super(cast(GtkComboBox*)gtkComboBoxText);
		this.gtkComboBoxText = gtkComboBoxText;
	}
	
	protected override void setStruct(GObject* obj)
	{
		super.setStruct(obj);
		gtkComboBoxText = cast(GtkComboBoxText*)obj;
	}
	
	/**
	 * Creates a new ComboBoxText, which is a ComboBox just displaying strings.
	 * Params:
	 *   entry = If true, create an ComboBox with an entry.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (bool entry=true)
	{
		GtkComboBoxText* p;
		if ( entry )
		{
			// GtkWidget* gtk_combo_box_text_new_with_entry (void);
			p = cast(GtkComboBoxText*)gtk_combo_box_text_new_with_entry();
		}
		else
		{
			// GtkWidget* gtk_combo_box_text_new (void);
			p = cast(GtkComboBoxText*)gtk_combo_box_text_new();
		}
		
		if(p is null)
		{
			throw new ConstructionException("null returned by gtk_combo_box_new");
		}
		
		this(p);
	}
	
	/** */
	public void setActiveText(string text, bool insert=false)
	{
		int active = 0;
		setActive(0);
		while ( getActive >= 0 ) // returns -1 if end of list if reached
		{
			if( text == getActiveText() ) return;
			++active;
			setActive(active);
		}
		// was not found, the combo has now nothing selected
		if ( insert )
		{
			append("", text);
			setActive(active);
		}
	}
	
	/** */
	int getIndex(string text)
	{
		TreeIter iter = new TreeIter();
		TreeModelIF model = getModel();
		iter.setModel(model);
		int index = 0;
		bool found = false;
		bool end = false;
		if ( model.getIterFirst(iter) )
		{
			while ( !end && iter !is  null && !found )
			{
				found = iter.getValueString(0) == text;
				if ( !found )
				{
					end = !model.iterNext(iter);
					++index;
				}
			}
		}
		else
		{
			end = true;
		}
		return end ? -1 : index;
	}
	
	/** */
	void prependOrReplaceText(string text)
	{
		int index = getIndex(text);
		if ( index > 0 )
		{
			remove(index);
			prepend("", text);
		}
		else if ( index == -1 )
		{
			prepend("", text);
		}
	}
	
	/**
	 */
	
	/**
	 * Appends text to the list of strings stored in combo_box.
	 * If id is non-NULL then it is used as the ID of the row.
	 * This is the same as calling gtk_combo_box_text_insert() with a
	 * position of -1.
	 * Since 2.24
	 * Params:
	 * id = a string ID for this value, or NULL. [allow-none]
	 * text = A string
	 */
	public void append(string id, string text)
	{
		// void gtk_combo_box_text_append (GtkComboBoxText *combo_box,  const gchar *id,  const gchar *text);
		gtk_combo_box_text_append(gtkComboBoxText, Str.toStringz(id), Str.toStringz(text));
	}
	
	/**
	 * Prepends text to the list of strings stored in combo_box.
	 * If id is non-NULL then it is used as the ID of the row.
	 * This is the same as calling gtk_combo_box_text_insert() with a
	 * position of 0.
	 * Since 2.24
	 * Params:
	 * id = a string ID for this value, or NULL. [allow-none]
	 * text = a string
	 */
	public void prepend(string id, string text)
	{
		// void gtk_combo_box_text_prepend (GtkComboBoxText *combo_box,  const gchar *id,  const gchar *text);
		gtk_combo_box_text_prepend(gtkComboBoxText, Str.toStringz(id), Str.toStringz(text));
	}
	
	/**
	 * Inserts text at position in the list of strings stored in combo_box.
	 * If id is non-NULL then it is used as the ID of the row. See
	 * "id-column".
	 * If position is negative then text is appended.
	 * Params:
	 * position = An index to insert text
	 * id = a string ID for this value, or NULL. [allow-none]
	 * text = A string to display
	 * Since 3.0
	 */
	public void insert(int position, string id, string text)
	{
		// void gtk_combo_box_text_insert (GtkComboBoxText *combo_box,  gint position,  const gchar *id,  const gchar *text);
		gtk_combo_box_text_insert(gtkComboBoxText, position, Str.toStringz(id), Str.toStringz(text));
	}
	
	/**
	 * Appends text to the list of strings stored in combo_box.
	 * This is the same as calling gtk_combo_box_text_insert_text() with a
	 * position of -1.
	 * Since 2.24
	 * Params:
	 * text = A string
	 */
	public void appendText(string text)
	{
		// void gtk_combo_box_text_append_text (GtkComboBoxText *combo_box,  const gchar *text);
		gtk_combo_box_text_append_text(gtkComboBoxText, Str.toStringz(text));
	}
	
	/**
	 * Prepends text to the list of strings stored in combo_box.
	 * This is the same as calling gtk_combo_box_text_insert_text() with a
	 * position of 0.
	 * Since 2.24
	 * Params:
	 * text = A string
	 */
	public void prependText(string text)
	{
		// void gtk_combo_box_text_prepend_text (GtkComboBoxText *combo_box,  const gchar *text);
		gtk_combo_box_text_prepend_text(gtkComboBoxText, Str.toStringz(text));
	}
	
	/**
	 * Inserts text at position in the list of strings stored in combo_box.
	 * If position is negative then text is appended.
	 * This is the same as calling gtk_combo_box_text_insert() with a NULL
	 * ID string.
	 * Since 2.24
	 * Params:
	 * position = An index to insert text
	 * text = A string
	 */
	public void insertText(int position, string text)
	{
		// void gtk_combo_box_text_insert_text (GtkComboBoxText *combo_box,  gint position,  const gchar *text);
		gtk_combo_box_text_insert_text(gtkComboBoxText, position, Str.toStringz(text));
	}
	
	/**
	 * Removes the string at position from combo_box.
	 * Since 2.24
	 * Params:
	 * position = Index of the item to remove
	 */
	public void remove(int position)
	{
		// void gtk_combo_box_text_remove (GtkComboBoxText *combo_box,  gint position);
		gtk_combo_box_text_remove(gtkComboBoxText, position);
	}
	
	/**
	 * Removes all the text entries from the combo box.
	 */
	public override void removeAll()
	{
		// void gtk_combo_box_text_remove_all (GtkComboBoxText *combo_box);
		gtk_combo_box_text_remove_all(gtkComboBoxText);
	}
	
	/**
	 * Returns the currently active string in combo_box, or NULL
	 * if none is selected. If combo_box contains an entry, this
	 * function will return its contents (which will not necessarily
	 * be an item from the list).
	 * Since 2.24
	 * Returns: a newly allocated string containing the currently active text. Must be freed with g_free().
	 */
	public string getActiveText()
	{
		// gchar * gtk_combo_box_text_get_active_text (GtkComboBoxText *combo_box);
		return Str.toString(gtk_combo_box_text_get_active_text(gtkComboBoxText));
	}
}
