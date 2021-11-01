<template>
    <v-container
            class="fill-height"
            fluid
    >
        <v-row justify="center" align="center">
            <v-col
                    cols="12"
                    sm="8"
                    md="6">
                <v-card class="elevation-12">
                    <v-card-text>

                        <v-form
                                ref="form"
                                v-model="valid"
                                lazy-validation
                        >
                            <v-text-field
                                    v-model="name"
                                    :counter="10"
                                    :rules="nameRules"
                                    label="Name"
                                    required
                                    prepend-icon="mdi-account"
                            ></v-text-field>

                            <v-text-field
                                    v-model="email"
                                    :rules="emailRules"
                                    label="E-mail"
                                    required
                                    prepend-icon="mdi-email"
                            ></v-text-field>

                            <v-text-field
                                    v-model="password"
                                    :rules="passwordRules"
                                    label="Password"
                                    required
                                    prepend-icon="mdi-lock"
                                    type="password"
                            ></v-text-field>

                            <v-text-field
                                    v-model="passwordConfirmation"
                                    :rules="passwordConfirmationRules"
                                    label="PasswordConfirmation"
                                    required
                                    prepend-icon="mdi-lock"
                                    type="password"
                            ></v-text-field>

                        </v-form>
                    </v-card-text>

                    <v-card-actions>
                        <router-link to="/login" class="text-decoration-none caption">ログインページへ</router-link>
                        <v-spacer></v-spacer>
                        <v-btn dark color="indigo" @click="signup">新規登録</v-btn>
                    </v-card-actions>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>

