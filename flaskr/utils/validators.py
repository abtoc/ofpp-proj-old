from wtforms.validators import Required, Regexp

class RequiredNotIf(Required):
    def __init__(self, other_field_name, *args, **kwargs):
        self.other_field_name = other_field_name
        super(RequiredNotIf, self).__init__(*args, **kwargs)
    def __call__(self, form, field):
        other_field = form._fields.get(self.other_field_name)
        if other_field is None:
            raise Exception('no field named "%s" in form' % self.other_field_name)
        if not bool(other_field.data):
            super(RequiredNotIf, self).__call__(form, field)

class RegexpNotIf(Regexp):
    def __init__(self, other_field_name, *args, **kwargs):
        self.other_field_name = other_field_name
        super(RegexpNotIf, self).__init__(*args, **kwargs)
    def __call__(self, form, field):
        other_field = form._fields.get(self.other_field_name)
        if other_field is None:
            raise Exception('no field named "%s" in form' % self.other_field_name)
        if not bool(other_field.data):
            super(RegexpNotIf, self).__call__(form, field)
