/**
* Ein leeres Projekt für Aufgabe 1 und 2
*/

#include <iostream>
#ifdef WIN32
#include <windows.h>
#endif
#define GLM_FORCE_RADIANS
#include <glm.hpp>
#include <gtc/quaternion.hpp>
#include <gtc/type_ptr.hpp>
#include <gtx/string_cast.hpp>
#include <GLTools.h>
#include <GLMatrixStack.h>
#include <GLGeometryTransform.h>
#include <GLFrustum.h>
#include <math.h>
#include <math3d.h>
#include <GL/freeglut.h>
#include <AntTweakBar.h>

GLShaderManager shaderManager;
GLMatrixStack modelViewMatrix;
GLMatrixStack projectionMatrix;
GLGeometryTransform transformPipeline;
GLFrustum viewFrustum;
GLBatch geometry;
GLBatch sierpinski_dreieck;
GLTriangleBatch triangleBatch;


// Rotationsgroessen
glm::quat rotation = glm::quat(0, 0, 0, 1);

// Kamera Translation
static float xTrans = 0.0f;
static float yTrans = 0.0f;
static float zTrans = 0.0f;


//GUI
TwBar *bar;
void InitGUI()
{
	bar = TwNewBar("TweakBar");
	TwDefine(" TweakBar size='200 400'");
	TwAddVarRW(bar,"Model Rotation",TW_TYPE_QUAT4F, &rotation, "");
	//Hier weitere GUI Variablen anlegen. Für Farbe z.B. den Typ TW_TYPE_COLOR4F benutzen
}

void CreateGeometry()
{
	//Würfel der Größe 10 erzeugen
	//gltMakeCube(geometry, 10.0f);
	//gltMakeCylinder(triangleBatch, 10.0f, 5.0f, 30.0f, 10, 10);

	//sierpinski_dreieck erzeugen
	sierpinski_dreieck.Begin(GL_TRIANGLE_FAN, 3);
	sierpinski_dreieck.Color4f(0, 1, 0, 1);
	sierpinski_dreieck.Vertex3f(0, 0, 1);
	sierpinski_dreieck.Vertex3f(1, 0, 1);
	sierpinski_dreieck.Vertex3f(0.5f, 1, 1);
	sierpinski_dreieck.End();

}

// Aufruf draw scene
void RenderScene(void)
{
	// Clearbefehle für den color buffer und den depth buffer
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	
	// Speichere den matrix state und führe die Rotation und Translation durch
	modelViewMatrix.PushMatrix();
	
	// Kamera Translation
	modelViewMatrix.Translate(xTrans, 0.0f, 0.0f);
	
	// Model Rotatation
	glm::mat4 rot = glm::mat4_cast(rotation);
    modelViewMatrix.MultMatrix(glm::value_ptr(rot));

	const float color[] = {1.0f, 0.5f, 0.0f, 1.0f};
	//setze den Shader für das Rendern und übergebe die Model-View-Projection Matrix
	shaderManager.UseStockShader(GLT_SHADER_FLAT, transformPipeline.GetModelViewProjectionMatrix(), color);

	//Hier zeichnen
	geometry.Draw();
	triangleBatch.Draw();
	sierpinski_dreieck.Draw();
	
	//Auf fehler überprüfen
	gltCheckErrors(0);
	// Hole die im Stack gespeicherten Transformationsmatrizen wieder zurück
	modelViewMatrix.PopMatrix();

	TwDraw();
	// Vertausche Front- und Backbuffer
	glutSwapBuffers();
	glutPostRedisplay();
}

// Initialisierung des Rendering Kontextes
void SetupRC()
{
	// Schwarzer Hintergrund
	glClearColor(0.5f, 0.5f, 1.0f, 1.0f);

	glFrontFace(GL_CW);
	glEnable(GL_CULL_FACE);
	glEnable(GL_DEPTH_TEST);

	//initialisiert die standard shader
	shaderManager.InitializeStockShaders();
	//Matrix stacks für die Transformationspipeline setzen, damit werden dann automatisch die Matrizen multipliziert
	transformPipeline.SetMatrixStacks(modelViewMatrix,projectionMatrix);
	//erzeuge die geometrie
	CreateGeometry();
	InitGUI();
}

void SpecialKeys(int key, int x, int y)
{
	switch(key)
	{
	  case GLUT_KEY_UP:
	    //Vorwärts
	    break;
	  case GLUT_KEY_DOWN:
	    //Rückwärts
	    break;
	  case GLUT_KEY_LEFT:
	    xTrans += 1.0f;
	    break;
	  case GLUT_KEY_RIGHT:
	    xTrans -= 1.0f;
	    break;
	  case GLUT_KEY_PAGE_UP:
	    //Hoch
	    break;
	  case GLUT_KEY_PAGE_DOWN:
	    //Runter
	    break;
	    
	  default:
	    break;
	}
	
	TwEventKeyboardGLUT(key, x, y);
}


void ChangeSize(int w, int h)
{
	GLfloat nRange = 100.0f;

	// Verhindere eine Division durch Null
	if(h == 0)
		h = 1;
	// Setze den Viewport gemaess der Window-Groesse
	glViewport(0, 0, w, h);
	// Ruecksetzung des Projection matrix stack
	projectionMatrix.LoadIdentity();
	
	// Definiere das viewing volume (left, right, bottom, top, near, far)
	if (w <= h) 
		viewFrustum.SetOrthographic(-nRange, nRange, -nRange*h/w, nRange*h/w, -nRange, nRange);
	else 
		viewFrustum.SetOrthographic(-nRange*w/h, nRange*w/h, -nRange, nRange, -nRange, nRange);
	projectionMatrix.LoadMatrix(viewFrustum.GetProjectionMatrix());
	// Ruecksetzung des Model view matrix stack
	modelViewMatrix.LoadIdentity();
	
	TwWindowSize(w, h);
}

void ShutDownRC()
{
	//Aufräumen
	TwTerminate();
}

int main(int argc, char* argv[])
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(800,600);
	glutCreateWindow("Aufgabe1");
	glutCloseFunc(ShutDownRC);
	
	GLenum err = glewInit();
	if (GLEW_OK != err)
	{
		// Veralteter Treiber etc.
		std::cerr <<"Error: "<< glewGetErrorString(err) << "\n";
		return 1;
	}
	
	//GLUT Callbacks setzen
	//Um Mausevents selbst zu erhalten eigene Funktionen für glutMouseFunc, glutMotionFunc, glutPassiveMotionFunc setzen
	glutMouseFunc((GLUTmousebuttonfun)TwEventMouseButtonGLUT);
	glutMotionFunc((GLUTmousemotionfun)TwEventMouseMotionGLUT);
	glutPassiveMotionFunc((GLUTmousemotionfun)TwEventMouseMotionGLUT); // same as MouseMotion
	glutKeyboardFunc((GLUTkeyboardfun)TwEventKeyboardGLUT);

	
	glutReshapeFunc(ChangeSize);
	glutSpecialFunc(SpecialKeys);
	glutDisplayFunc(RenderScene);
	
	TwInit(TW_OPENGL_CORE, NULL);
	SetupRC();

	glutMainLoop();

	return 0;
}
