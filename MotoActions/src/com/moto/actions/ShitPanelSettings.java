
/*
 * Copyright (C) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.moto.actions;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.res.Resources;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.os.SystemProperties;
import android.provider.Settings;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.preference.TwoStatePreference;
import android.text.TextUtils;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;
import android.util.Log;

import com.moto.actions.R;

public class ShitPanelSettings extends PreferenceActivity implements
                                  Preference.OnPreferenceChangeListener {

private static final String BIG_KEY = "big";
    private static final String BIG_SYSTEM_PROPERTY = "persist.big.profile";

private ListPreference mBig;

@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main_panel);

 mBig = (ListPreference) findPreference(BIG_KEY);
        if( mBig != null ) {
            mBig.setValue(SystemProperties.get(BIG_SYSTEM_PROPERTY, "0"));
            mBig.setOnPreferenceChangeListener(this);
        }
    }

     @Override
     public boolean onPreferenceChange(Preference preference, Object newValue) {
         final String key = preference.getKey();
         boolean value;
         String strvalue;
         if (BIG_KEY.equals(key)) {
            strvalue = (String) newValue;
            SystemProperties.set(BIG_SYSTEM_PROPERTY, strvalue);
            return true;
         }
        return true;
     }
}
