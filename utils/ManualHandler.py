#!/usr/bin/env python3

try:
    import tkinter as tk

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class ResultDialog(tk.Frame):

    def __init__(self, master, test_name, test_steps):
        super().__init__(master)
        if not self.master:
            self.master = tk.Tk()
        self.test_name = test_name
        self.test_steps = test_steps
        self.PASS = 'PASS'
        self.FAIL = 'FAIL'

        self.status = None
        self.comment = None

        self.MAX_WIDTH = self.master.winfo_screenwidth()
        self.MAX_HEIGHT = self.master.winfo_screenheight()

    def __call__(self, *args, **kwargs):
        self.master.title(self.test_name)
        x = self.MAX_WIDTH // 50
        y = self.MAX_HEIGHT // 50
        self.master.geometry(f'+{x}+{y}')
        self.master.resizable(width=False, height=False)

        test_docs_area = self.add_test_docs_area()
        comment_area = self.add_comment_area()
        pass_button = self.add_pass_button()
        fail_button = self.add_fail_button()

        test_docs_area.pack(side=tk.LEFT, pady=self.MAX_HEIGHT//150, padx=self.MAX_WIDTH//150)
        comment_area.pack(side=tk.LEFT, pady=self.MAX_HEIGHT//150, padx=self.MAX_WIDTH//150)
        pass_button.pack(pady=self.MAX_HEIGHT//300, padx=self.MAX_WIDTH//300)
        fail_button.pack(pady=self.MAX_HEIGHT//300, padx=self.MAX_WIDTH//300)

        self.master.mainloop()
        return self.status, self.comment

    def add_test_docs_area(self):
        test_docs_area = tk.Frame(self.master, borderwidth=1, relief='sunken')
        tk.Label(test_docs_area, text='Test Documentation').pack(anchor='w')
        text_area = tk.Text(test_docs_area, bg='#ffffff', font=('Calibri', 11),
                            width=self.MAX_WIDTH//20,
                            highlightbackground='#ffffff', highlightcolor='#7baedc')
        text_area.insert(tk.INSERT, self.test_steps)
        text_area.config(state=tk.DISABLED)
        text_area.focus_set()
        text_area.pack()
        return test_docs_area

    def add_comment_area(self):
        comment_area = tk.Frame(self.master, borderwidth=1, relief='sunken')
        tk.Label(comment_area, text='Comment').pack(anchor='w')
        text_area = tk.Text(comment_area, bg='#ffffff', font=('Calibri', 11),
                            width=self.MAX_WIDTH//20,
                            highlightbackground='#ffffff', highlightcolor='#7baedc')
        text_area.focus_set()
        text_area.pack()
        self.comment_box = text_area  # to retrieve comment
        return comment_area

    def add_pass_button(self):
        def mark_pass():
            self.comment = self.comment_box.get('1.0', tk.END)
            self.status = self.PASS
            self.master.destroy()
        pass_button_wrapper = tk.Frame(self.master, borderwidth=1, relief='sunken')
        tk.Button(pass_button_wrapper, text=self.PASS, command=mark_pass,
                  font=(None, 15, 'bold'), bg='green3', fg='white',
                  width=self.MAX_WIDTH//200).pack()
        return pass_button_wrapper

    def add_fail_button(self):
        def mark_fail():
            self.comment = self.comment_box.get('1.0', tk.END)
            self.status = self.FAIL
            self.master.destroy()
        fail_button_wrapper = tk.Frame(self.master, borderwidth=1, relief='sunken')
        tk.Button(fail_button_wrapper, text=self.FAIL, command=mark_fail,
                  font=(None, 15, 'bold'), bg='red2', fg='white',
                  width=self.MAX_WIDTH//200).pack()
        return fail_button_wrapper
