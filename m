Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6D62533DB0D
	for <lists+cluster-devel@lfdr.de>; Tue, 16 Mar 2021 18:34:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615916059;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W9JCTQW/M0C9E9SZplD1p5K+MCbT/F4QqVMZXmNioJ0=;
	b=HCTG2JqwUEIFRIc6BQMtLfaHKobdqCJwlfkJ71Q5wbK6ozR3gmmYlDyasRN2arsQBmNFBJ
	C329DoVj5urTZFLSA+BVxzXLsPbQTg2olVySieT7jDjgv9wS7kdySZfy7QXdV3JTJPeyFv
	7bvfMznl8evAMuMVa7S1czv+UW5ZMHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-h5EKaXLMNCqrQE71OxpX0Q-1; Tue, 16 Mar 2021 13:34:17 -0400
X-MC-Unique: h5EKaXLMNCqrQE71OxpX0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9429769724;
	Tue, 16 Mar 2021 17:34:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D88FD5D9C0;
	Tue, 16 Mar 2021 17:34:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85D8057DC3;
	Tue, 16 Mar 2021 17:34:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12GHY4RP011623 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 13:34:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CDC36E418; Tue, 16 Mar 2021 17:34:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from ovpn-112-197.ams2.redhat.com (ovpn-112-197.ams2.redhat.com
	[10.36.112.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCD136A045;
	Tue, 16 Mar 2021 17:33:56 +0000 (UTC)
Message-ID: <67ecd684c22170be49be3ca9b28fdb7db5c61c36.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Alexander Aring <aahringo@redhat.com>, teigland@redhat.com
Date: Tue, 16 Mar 2021 18:33:55 +0100
In-Reply-To: <20210310191745.80824-8-aahringo@redhat.com>
References: <20210310191745.80824-1-aahringo@redhat.com>
	<20210310191745.80824-8-aahringo@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com
Subject: Re: [Cluster-devel] [PATCHv2 dlm/next 7/8] fs: dlm: add reliable
 connection if reconnect
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-03-10 at 14:17 -0500, Alexander Aring wrote:
> @@ -116,32 +905,21 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
>  		if (msglen > len)
>  			break;
>  
> -		switch (hd->h_cmd) {
> -		case DLM_MSG:
> -			if (msglen < sizeof(struct dlm_message)) {
> -				log_print("dlm msg too small: %u, will skip this message",
> -					  msglen);
> -				goto skip;
> -			}
> -
> +		idx = srcu_read_lock(&nodes_srcu);
> +		switch (le32_to_cpu(hd->h_version)) {
> +		case DLM_VERSION_3_1:
> +			dlm_midcomms_receive_buffer_3_1((union dlm_packet *)ptr, nodeid);
>  			break;
> -		case DLM_RCOM:
> -			if (msglen < sizeof(struct dlm_rcom)) {
> -				log_print("dlm rcom msg too small: %u, will skip this message",
> -					  msglen);
> -				goto skip;
> -			}
> -
> +		case DLM_VERSION_3_2:
> +			dlm_midcomms_receive_buffer_3_2((union dlm_packet *)ptr, nodeid);
>  			break;
>  		default:
> -			log_print("unsupported h_cmd received: %u, will skip this message",
> -				  hd->h_cmd);
> -			goto skip;
> +			log_print("received invalid version header: %u from node %d, will skip this message",
> +				  le32_to_cpu(hd->h_version), nodeid);
> +			break;
>  		}
> +		srcu_read_unlock(&nodes_srcu, idx);

I think the srcu usage will be more clear if the lock/unlock are moved
inside dlm_midcomms_receive_buffer_3_2() and dlm_midcomms_receive_buffe
r_3_1(), so that they wrap the node lookup and access.

Cheers,

Paolo

