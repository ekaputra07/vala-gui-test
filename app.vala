using Gtk;

// when window close clicked
public void on_window1_destroy(Window source){
    Gtk.main_quit();
}

// Move text function
public void move_text(Entry entry1, Entry entry2){
    entry2.set_text(entry1.get_text());
    entry1.set_text("");
}

// App init
int main(string[] args){
    Gtk.init(ref args);

    var builder = new Builder();

    builder.add_from_file("window1.glade");
    builder.connect_signals(null);

    // get our UI objects
    var window = builder.get_object("window1") as Window;
    var button = builder.get_object("button1") as Button;
    var entry1 = builder.get_object("entry1") as Entry;
    var entry2 = builder.get_object("entry2") as Entry;

    // When button clicked, text from entry1 moved to entry2.
    button.clicked.connect(() => {
        move_text(entry1, entry2);
    });

    window.show_all();
    Gtk.main();

    return 0;
}

