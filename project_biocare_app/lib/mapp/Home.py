#!/usr/bin/env python3

try:
    from project_biocare_app.lib.MappScreen import MappScreen
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Home(MappScreen):
    """
    Handle initial screens and login screen
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, app, env):
        super().__init__(app=app, env=env, screen='home')

    def get_latest_measurements_info(self):
        pass

    def get_medications_info(self):
        pass

    def add_measurements_manually(self, items):
        self.app.wait_visibility_of_element_located(self.LCT.ADD_MANUALLY)
        self.app.tap(self.LCT.ADD_MANUALLY)
        attr = self._map_value(android='content-desc', ios=None)
        self.app.taps(
            self.LCT.MEASUREMENT_ITEMS,
            on_elements=lambda _, e: self.app.get_attribute_value(e, attr).lower().startswith(items.lower()),
            stop_on_first=True
        )

    def set_sleep_goal(self, hour=0, minute=0, save=True, close=False):
        attr = self._map_value(android='content-desc', ios=None)
        current_hour = int(self.app.get_attribute_value(self.LCT.HOUR, attr))
        current_min = int(self.app.get_attribute_value(self.LCT.MINUTE, attr))
        times = int(((hour - current_hour) * 2) + ((minute - current_min) / 30))
        locator_map = self.LCT.INCREASE if times > 0 else self.LCT.DECREASE
        [self.app.tap(locator_map) for _ in range(abs(times))]
        if save:
            self.app.taps(self.LCT.SAVEORCLOSE, on_elements=lambda e, _: e == 0, stop_on_first=True)
        if close:
            self.app.taps(self.LCT.SAVEORCLOSE, on_elements=lambda e, _: e == 1, stop_on_first=True)

    def add_body_temperature_manually(self, temperature=None, save=True, close=False):
        self.app.wait_visibility_of_element_located(self.LCT.TEMPERATURE)
        if temperature:
            map_temperature = {
                True: "°F",
                False: "°C"
            }
            cond = temperature.endswith('°F')
            if self.app.get_attribute_value(self.LCT.TEMPERATURE_TYPE, 'content-desc') != map_temperature[cond]:
                self.app.tap(self.LCT.TEMPERATURE_TYPE)
            _temperature = temperature.replace('°F', '').replace('°C', '').strip()
            attr = self._map_value(android='content-desc', ios=None)
            self.app.taps(
                self.LCT.TEMPERATURE,
                on_elements=lambda _, e: self.app.get_attribute_value(e, attr).lower().startswith(_temperature.lower()),
                stop_on_first=True
            )
        if save:
            self.app.taps(self.LCT.SAVEORCLOSE, on_elements=lambda e, _: e == 0, stop_on_first=True)
        if close:
            self.app.taps(self.LCT.SAVEORCLOSE, on_elements=lambda e, _: e == 1, stop_on_first=True)

    def add_spo2_manually(self, spo2=None, save=True, close=False):
        self.app.wait_visibility_of_element_located(self.LCT.SPO2)
        attr = self._map_value(android='content-desc', ios=None)
        if spo2:
            current = int(self.app.get_attribute_value(self.LCT.SPO2, attr))
            times = int(current - spo2)
            locator_map = self.LCT.SUB_SPO2 if times > 0 else self.LCT.ADD_SPO2
            [self.app.tap(locator_map) for _ in range(abs(times))]
        if save:
            self.app.taps(self.LCT.SAVEORCLOSE, on_elements=lambda e, _: e == 0, stop_on_first=True)
        if close:
            self.app.taps(self.LCT.SAVEORCLOSE, on_elements=lambda e, _: e == 1, stop_on_first=True)

    def add_weight_manually(self, weight=None, save=True, close=False):
        self.app.wait_visibility_of_element_located(self.LCT.WEIGHT)
        attr = self._map_value(android='content-desc', ios=None)
        if weight:
            current = float(self.app.get_attribute_value(self.LCT.WEIGHT, attr))
            locator_map = self.LCT.RIGHT_WEIGHT if current > float(weight) else self.LCT.LEFT_WEIGHT
            while True:
                self.app.scroll(self.LCT.WEIGHT, locator_map)
                if float(self.app.get_attribute_value(self.LCT.WEIGHT, attr)) == float(weight):
                    break
        if save:
            self.app.taps(self.LCT.SAVEORCLOSE, on_elements=lambda e, _: e == 0, stop_on_first=True)
        if close:
            self.app.taps(self.LCT.SAVEORCLOSE, on_elements=lambda e, _: e == 1, stop_on_first=True)

    def add_heart_rate_manually(self, heart_rate=None, save=True, close=False):
        self.app.wait_visibility_of_element_located(self.LCT.HEART_RATE)
        attr = self._map_value(android='content-desc', ios=None)
        if heart_rate:
            current = self.app.get_attribute_value(self.LCT.HEART_RATE, attr)
            index = (int(current.replace('bpm', '').strip()) - 40) + 1
            index_map = index + 2 if int(current.replace('bpm', '').strip()) > int(
                heart_rate.replace('bpm', '').strip()) else index - 2
            while True:
                self.app.scroll(self.LCT.HEART_RATE_VALUE + '[' + str(index) + ']',
                                self.LCT.HEART_RATE_VALUE + '[' + str(index_map) + ']')
                if self.app.get_attribute_value(self.LCT.HEART_RATE, attr) == heart_rate:
                    break
        if save:
            self.app.taps(self.LCT.SAVEORCLOSE, on_elements=lambda e, _: e == 0, stop_on_first=True)
        if close:
            self.app.taps(self.LCT.SAVEORCLOSE, on_elements=lambda e, _: e == 1, stop_on_first=True)

    def add_medication(self):
        self.app.tap(self.LCT.VIEW_ALL_MED)

