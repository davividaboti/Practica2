#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 512

float Mat[N][N];
float MatDD[N][N];  
float V1[N];
float V2[N];
float V3[N];
float V4[N];
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
  for (j=from; j<=numel; j++){
   printf("%f \n",mat[row][j]); 
  }
} 


void MultEscalar( float vect[N], float vectres[N], float alfa, int from, int numel ){
int i;
for (i=0;i<N;i++){
 vectres[i]=vect[i]*alfa;
}
for (i=from; i<numel; i++) {
   printf("%f \n",vect[i]);
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
float mag = 0.0;
int i;
for (i=0; i<N; i++){
 mag += vect[i]*vect[i];
 }
return mag;
}


int Ortogonal (float vect1[N], float vect2[N]){
    float orto = 0;
    int i;
    for (i=0; i<N; i++){
        orto = orto + vect1[i]*vect2[i];
    }
    if (orto==0){
	    return 1; }
    else{ 
        return 0; }
}

int Ortogonal_resultat (float vect1[N], float vect2[N]){
    float orto = 0;
    int i;
    for (i=0; i<N; i++){
        orto += vect1[i]*vect2[i];
    }
    return orto;
    }


void Projection( float vect1[N], float vect2[N], float vectres[N], int from, int numel ){
 float scalar = Scalar(vect1,vect2);
 float magnitud = Magnitude(vect2);
 int i;
 vectres[N] = (scalar / magnitud) * (vect2[N]);
 for (i=from; i<numel; i++) {
   printf("La projecció és: %f \n",vectres[i]);
 }
}


float Infininorm( float M[N][N] ){
 int i;
 int infini_norma=0;
 int llista[N];
 for (i=0; i<(N); i++){
    infini_norma = infini_norma + fabs(M[i][0]);
    llista[i] = infini_norma;
        }
 for (i=0; i<(N); i++){
    if (llista[0] < llista[i]) {
        llista[0] = llista[i];
    }
    }
 return llista[0];
}

float Onenorm( float M[N][N] ){
 int j;
 int one_norma=0;
 int llista[N];
 for (j=0; j<(N); j++){
    one_norma = one_norma + fabs(M[0][j]);
    llista[j] = one_norma;
        }
 for (j=0; j<(N); j++){
    if (llista[0] < llista[j]) {
        llista[0] = llista[j];
    }
    }
 return llista[0];
}

int NormForbenius( float M[N][N] ){
    int i, j;
    int suma = 0;
    int resultat=0;
    for (i=0; i<N; i++) {
        for (j=0; j<(N); j++){
            suma = suma + pow(M[i][j],2);
        }
    }
    resultat = sqrt(suma);
    return resultat;
}

int DiagonalDom( float M[N][N] ) {
 int i, j, x;
 int suma = 0;
 int elements = 0;
 int diagonal = 0;
 for (i=0; i<N; i++) {
   for (j=0; j<N; j++){
    if (i == j) {
     x =  fabs(M[i][j]);
     elements += 1;
    }
    else {
     suma += fabs(M[i][j]);
    }
   }
 if (x>suma) {
   diagonal +=1;
 }
 }
 if (diagonal == elements) {
   return 1;
 }
 else {
   return 0;
 }
}


int main(){
 printf("Inicialitzo \n");
 InitData();
 
 printf("Imprimeixo vector V1 del 0 al 9 \n");
 PrintVect(V1, 0, 9);
 printf("Imprimeixo vector V1 del 256 al 265 \n");
 PrintVect(V1, 256, 265);

 printf("Imprimeixo vector V2 del 0 al 9 \n");
 PrintVect(V2, 0, 9);
 printf("Imprimeixo vector V2 del 256 al 265 \n");
 PrintVect(V2, 256, 265);
 
 printf("Imprimeixo vector V3 del 0 al 9 \n");
 PrintVect(V3, 0, 9);
 printf("Imprimeixo vector V3 del 256 al 265 \n");
 PrintVect(V3, 256, 265);

 printf("Imprimeixo els elements 0 al 9 de la fila 0 de la matriu Mat \n");
 PrintRow(Mat, 0, 0, 9);

 printf("Imprimeixo els elements 0 al 9 de la fila 100 de la matriu Mat \n");
 PrintRow(Mat, 100, 0, 9);

 printf("Imprimeixo els elements 0 al 9 de la fila 0 de la matriu MatDD \n");
 PrintRow(MatDD, 0, 0, 9);

 printf("Imprimeixo els elements 0 al 9 de la fila 100 de la matriu MatDD \n");
 PrintRow(MatDD, 100, 90, 99);

 printf("Imprimeixo la infininorma de la matriu Mat \n");
 float infininorm = Infininorm(Mat);
 printf("%f \n",infininorm);
 
 printf("Imprimeixo la norma ú de la matriu Mat \n");
 float oneform = Onenorm(Mat);
 printf("%f \n",oneform);
 
 printf("Imprimeixo la norma de Frobenius de la matriu Mat \n");
 float normforbenius = NormForbenius(Mat);
 printf("%f \n",normforbenius); 

 printf("Imprimeixo si la matriu Mat és o no diagonal dominant \n");
 int diagonal = DiagonalDom(Mat);
 if (diagonal == 0){
    printf("La matriu Mat no és diagonal dominant \n");
 }
 else {
    printf("La matriu Mat és diagonal dominant \n");
 }

 printf("Imprimeixo la infininorma de la matriu MatDD \n");
 float infininorm1 = Infininorm(MatDD);
 printf("%f \n",infininorm1);
 
 printf("Imprimeixo la norma ú de la matriu MatDD \n");
 float oneform1 = Onenorm(MatDD);
 printf("%f \n",oneform1);
 
 printf("Imprimeixo la norma de Frobenius de la matriu MatDD \n");
 float normforbenius1 = NormForbenius(MatDD);
 printf("%f \n",normforbenius1); 

 printf("Imprimeixo si la matriu MatDD és o no diagonal dominant \n");
 int diagonal1 = DiagonalDom(MatDD);
 if (diagonal1 == 0){
    printf("La matriu MatDD no és diagonal dominant \n");
 }
 else {
    printf("La matriu MatDD és diagonal dominant \n");
 }

 printf("Imprimeixo el producte escalar de V1 i V2 \n");
 float prod_esc = Scalar(V1, V2);
 printf("%f \n", prod_esc);

 printf("Imprimeixo el producte escalar de V1 i V3 \n");
 float prod_esc1 = Scalar(V1, V3);
 printf("%f \n", prod_esc1);

 printf("Imprimeixo el producte escalar de V2 i V3 \n");
 float prod_esc2 = Scalar(V2, V3);
 printf("%f \n", prod_esc2);

 printf("Imprimeixo la magnitud de V1 \n");
 float magnitud = Magnitude(V1);
 printf("%f  \n",magnitud);

 printf("Imprimeixo la magnitud de V2 \n");
 float magnitud1 = Magnitude(V2);
 printf("%f  \n",magnitud1);

 printf("Imprimeixo la magnitud de V3 \n");
 float magnitud2 = Magnitude(V3);
 printf("%f  \n",magnitud2);

 printf("Imprimeixo si el vector V1 és o no ortogonal amb V2 \n");
 int ortogonal = Ortogonal(V1,V2);
 if (ortogonal == 0){
    printf("V1 i V2 no són ortogonals \n");
 }
 else {
    printf("V1 i V2 són ortogonals \n");
 }
 
 printf("Imprimeixo si el vector V1 és o no ortogonal amb V3 \n");
 int ortogonal1 = Ortogonal(V1,V3);
 if (ortogonal1 == 0){
    printf("V1 i V3 no són ortogonals \n");
 }
 else {
    printf("V1 i V3 són ortogonals \n");
 }
 
 printf("Imprimeixo si el vector V2 és o no ortogonal amb V3 \n");
 int ortogonal3 = Ortogonal(V2,V3);
 if (ortogonal3 == 0){
    printf("V2 i V3 no són ortogonals \n");
 }
 else {
    printf("V2 i V3 són ortogonals \n");
 }
 
 printf("Imprimeixo la multiplicació del vector V3 amb l'escalar 2.0 i visualitzem els elements de 0 a 9 \n");
 MultEscalar(V1, V4, 2.0, 0, 10);
 
 printf("Imprimeixo la multiplicació del vector V3 amb l'escalar 2.0 i visualitzem els elements de 256 a 265 \n");
 MultEscalar(V1, V4, 2.0, 0, 10);

 printf("Imprimeixo la projecció del vector V2 amb V3 \n");
 Projection(V2,V3,V4,0,10);

 printf("Imprimeixo la projecció del vector V1 amb V2 \n");
 Projection(V1,V2,V4,0,10);

return 0;
}
