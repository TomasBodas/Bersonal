﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UAIDesarrolloArquitectura.ServicePrecios {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.CollectionDataContractAttribute(Name="ArrayOfDecimal", Namespace="http://tempuri.org/", ItemName="decimal")]
    [System.SerializableAttribute()]
    public class ArrayOfDecimal : System.Collections.Generic.List<decimal> {
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServicePrecios.ObtPreciosSoap")]
    public interface ObtPreciosSoap {
        
        // CODEGEN: Generating message contract since element name ObtenerPreciosResult from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ObtenerPrecios", ReplyAction="*")]
        UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosResponse ObtenerPrecios(UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ObtenerPrecios", ReplyAction="*")]
        System.Threading.Tasks.Task<UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosResponse> ObtenerPreciosAsync(UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class ObtenerPreciosRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="ObtenerPrecios", Namespace="http://tempuri.org/", Order=0)]
        public UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequestBody Body;
        
        public ObtenerPreciosRequest() {
        }
        
        public ObtenerPreciosRequest(UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class ObtenerPreciosRequestBody {
        
        public ObtenerPreciosRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class ObtenerPreciosResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="ObtenerPreciosResponse", Namespace="http://tempuri.org/", Order=0)]
        public UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosResponseBody Body;
        
        public ObtenerPreciosResponse() {
        }
        
        public ObtenerPreciosResponse(UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class ObtenerPreciosResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public UAIDesarrolloArquitectura.ServicePrecios.ArrayOfDecimal ObtenerPreciosResult;
        
        public ObtenerPreciosResponseBody() {
        }
        
        public ObtenerPreciosResponseBody(UAIDesarrolloArquitectura.ServicePrecios.ArrayOfDecimal ObtenerPreciosResult) {
            this.ObtenerPreciosResult = ObtenerPreciosResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ObtPreciosSoapChannel : UAIDesarrolloArquitectura.ServicePrecios.ObtPreciosSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ObtPreciosSoapClient : System.ServiceModel.ClientBase<UAIDesarrolloArquitectura.ServicePrecios.ObtPreciosSoap>, UAIDesarrolloArquitectura.ServicePrecios.ObtPreciosSoap {
        
        public ObtPreciosSoapClient() {
        }
        
        public ObtPreciosSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ObtPreciosSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ObtPreciosSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ObtPreciosSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosResponse UAIDesarrolloArquitectura.ServicePrecios.ObtPreciosSoap.ObtenerPrecios(UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequest request) {
            return base.Channel.ObtenerPrecios(request);
        }
        
        public UAIDesarrolloArquitectura.ServicePrecios.ArrayOfDecimal ObtenerPrecios() {
            UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequest inValue = new UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequest();
            inValue.Body = new UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequestBody();
            UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosResponse retVal = ((UAIDesarrolloArquitectura.ServicePrecios.ObtPreciosSoap)(this)).ObtenerPrecios(inValue);
            return retVal.Body.ObtenerPreciosResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosResponse> UAIDesarrolloArquitectura.ServicePrecios.ObtPreciosSoap.ObtenerPreciosAsync(UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequest request) {
            return base.Channel.ObtenerPreciosAsync(request);
        }
        
        public System.Threading.Tasks.Task<UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosResponse> ObtenerPreciosAsync() {
            UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequest inValue = new UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequest();
            inValue.Body = new UAIDesarrolloArquitectura.ServicePrecios.ObtenerPreciosRequestBody();
            return ((UAIDesarrolloArquitectura.ServicePrecios.ObtPreciosSoap)(this)).ObtenerPreciosAsync(inValue);
        }
    }
}