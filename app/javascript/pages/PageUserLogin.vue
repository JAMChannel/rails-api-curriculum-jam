<template>
  <v-container class="fill-height" fluid >
    <v-row justify="center" align="center">
      <v-col
        cols="12"
        sm="8"
        md="6">
        <v-card class="elevation-12">
          <v-card-text>
            <v-form
                    ref="form"
                    lazy-validation
            >
              <v-text-field

                label="E-mail"
                required
                prepend-icon="mdi-email"
              ></v-text-field>

              <v-text-field
 
                label="Password"
                required
                prepend-icon="mdi-lock"
                type="password"
              ></v-text-field>
              
            </v-form>
          </v-card-text>
          <v-card-actions>
              <router-link to="/signup" class="text-decoration-none caption">ユーザー登録ページへ</router-link>
              <v-spacer></v-spacer>
              <v-btn dark color="indigo" >ログイン</v-btn>
          </v-card-actions>

        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>