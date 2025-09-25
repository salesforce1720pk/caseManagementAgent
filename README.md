# Case Management Apex Classes

This package provides a set of **Apex Invocable Methods** for managing **Case** records in Salesforce.  
They are designed to work in **Flows** and can also be exposed as **Agentforce actions**.

---

## 📌 Classes Included

### 1. CreateCaseClass
**Purpose**: Creates new Case records.  

**Inputs** (`Request`):
- `caseOrigin` (String, required)  
- `caseStatus` (String, required)  
- `caseSubject` (String, required)  

**Outputs** (`Response`):
- `caseId` → Id of the newly created Case.  

---

### 2. UpdateCaseClass
**Purpose**: Updates existing Case records.  

**Inputs** (`Request`):
- `caseId` (Id, required)  
- `caseOrigin` (String, optional)  
- `caseStatus` (String, optional)  

**Outputs** (`Response`):
- `caseNumber` → Number of the updated Case.  

> ⚡ Only updates fields that are provided (non-null).

---

### 3. GetCaseDetailsClass
**Purpose**: Retrieves Case details by Id.  

**Inputs** (`Request`):
- `caseId` (Id, required)  

**Outputs** (`Response`):
- `caseNumber`  
- `caseOrigin`  
- `caseStatus`  

> ✅ Bulkified: Supports fetching multiple Cases in a single call.

---

### 4. DeleteCaseClass
**Purpose**: Deletes Case records by Id.  

**Inputs** (`Request`):
- `caseId` (Id, required)  

**Outputs** (`Response`):
- `deletedCaseId` → Id of the attempted Case delete  
- `isDeleted` → Boolean flag (true if deleted, false otherwise)  
- `message` → Success or error message  

---

## 🚀 Usage

### In Flow
1. Add an **Action** element.  
2. Search for the invocable method (e.g. *Create Case*, *Update Case*).  
3. Map Flow variables to inputs.  
4. Use outputs in your Flow logic.  

### In Agentforce
1. Open **Agent Builder**.  
2. Add the desired Apex action to the agent’s **Action Library**.  
3. Configure input/output mappings.  
4. Test the agent with prompts like:  
   - “Create a Case with subject *Login Issue*.”  
   - “Update Case `500xx00000123ABC` to status *Closed*.”  
   - “Get details for Case `500xx00000123ABC`.”  
   - “Delete Case `500xx00000123ABC`.”  

---

## 🛠️ Best Practices
- Validate input before calling these methods.  
- Use in bulk where possible (all classes are bulkified).  
- For Agentforce, limit which actions are exposed for security.  
- Handle errors gracefully (output messages indicate success/failure).  

---

## ✅ Example Scenarios
- **Create Case**:  
  *“Create a Case with subject ‘Login Issue’, origin ‘Phone’, status ‘New’.”*  

- **Update Case**:  
  *“Update Case `500xx00000123ABC` to status ‘Closed’.”*  

- **Get Case Details**:  
  *“Fetch Case details for Id `500xx00000123ABC`.”*  

- **Delete Case**:  
  *“Delete Case `500xx00000123ABC`.”*  
