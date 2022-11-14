#include <stdio.h>
#include <stdlib.h>

#define N 5

float Mat[N][N];
float MatDD[N][N];  
float V1[N];
float V2[N];
float V3[N];
float V4[N];
float VRES[N];
float alfa;

void InitData(){
int i,j;
srand(8824553);
for( i = 0; i < N; i++ )
 for( j = 0; j < N; j++ ){
 Mat[i][j]=(((i*j)%3)?-1:1)*(100.0*(rand()/(1.0*RAND_MAX)));
 if ( (abs(i - j) <= 3) && (i != j))
 MatDD[i][j] = (((i*j)%3) ? -1 : 1)*(rand()/(1.0*RAND_MAX));
 else if ( i == j )
 MatDD[i][j]=(((i*j)%3)?-1:1)*(10000.0*(rand()/(1.0*RAND_MAX)));
 else MatDD[i][j] = 0.0;
 }
for( i = 0; i < N; i++ ){
 V1[i]=(i<N/2)?(((i*j)%3)?-1:1)*(100.0*(rand()/(1.0*RAND_MAX))):0.0;
 V2[i]=(i>=N/2)?(((i*j)%3)?-1:1)*(100.0*(rand()/(1.0*RAND_MAX))):0.0;
 V3[i]=(((i*j)%5)?-1:1)*(100.0*(rand()/(1.0*RAND_MAX)));
}
}


void PrintVect( float vect[N], int from, int numel ){ 
 int i;
 for (i=from; i<=numel; i++){
  printf("%f \n",vect[i]);
 }
}


void PrintRow( float mat[N][N], int row, int from, int numel ){
 int j;
  for (j=row; j<=numel; j++){
   printf("%f \n",mat[row][j]); 
  }
} 


void MultEscalar( float vect[N], float vectres[N], float alfa ){
int i;
for (i=0;i<N;i++){
 vectres[i]=vect[i]*alfa;
 printf("%f \n",vectres[i]);
}
}


float Scalar( float vect1[N], float vect2[N] ){
int i;
float ProducteEscalar = 0.0;
for (i=0; i<N; i++){
 ProducteEscalar += vect1[i] * vect2[i];
 }
return ProducteEscalar;
}


float Magnitude(float vect[N]){
float mag;
int i;
for (i=0; i<N; i++){
 mag += vect[i]*vect[i];
 }
return mag;
}


int Ortogonal (float vect1[N], float vect2[N]){
    float orto;
    int i;
    for (i=0; i<N; i++){
        orto += vect1[i]*vect2[i];
    }
    if (orto==0){
	    return 0; }
    else{ 
        return 1; }
}

int Ortogonal_resultat (float vect1[N], float vect2[N]){
    float orto;
    int i;
    for (i=0; i<N; i++){
        orto += vect1[i]*vect2[i];
    }
    return orto;
    }

void Projection( float vect1[N], float vect2[N], float vectres[N] ){
 MultEscalar(vect2,vectres,Scalar(vect1,vect2)/Magnitude(vect2));
}

float Infininorm( float M[N][N] ){
 int i, j;
 int infini_norma=0;
    for (i=0; i<(N-1); i++){
        for (j=0; j<(N-1); j++){
            infini_norma += M[i][j];
        }
    }
 return infini_norma;
}

int main(){
 printf("Inicialitzo \n");
 InitData();
 printf("Imprimeixo vector \n");
 PrintVect(V1, 0, 2);
 printf("Imprimeixo fila \n");
 PrintRow(Mat, 1, 3, 10);
 printf("Imprimeixo multiplicació escalar \n"); 
 MultEscalar(V1, VRES, 5.0);
 printf("Imprimeixo producte escalar \n");
 float prod_esc = Scalar(V3, V2);
 printf("%f scalar \n", prod_esc);
 float magnitud = Magnitude(V1);
 printf("%f magnitude \n",magnitud);
 int ortogonal = Ortogonal(V1,V2);
 printf("%d ortogonal \n",ortogonal);
 Projection(V1, V2, VRES);
 printf("%f", VRES);
 float infininorm = Infininorm(Mat);
 printf("%f infini_norma \n",infininorm);
return 0;
}
