Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 10756414AFE
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Sep 2021 15:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632318417;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GE4k44Vz+xzVyaqLpQd7dWfNFAR4ASg2ioloTwwbZ9o=;
	b=GKv5/ErdQgM8YSK/2EEQn2Sm0hTkXm2g5h/cnKhsqGHeCt31h6n9rmpqah8Ilz1u1dsco5
	MVHpkN3EA+wYbCPEEp35fNHye6lbq/PJQ2LGI7vqYx6FQaPKZRTIpAO/VHWCPJuIm3l5EH
	WXW2nruxCeFEhEQw0Y9b6l16/+uJSws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-n-JHyowqMiq7lbxMHI3nNA-1; Wed, 22 Sep 2021 09:46:55 -0400
X-MC-Unique: n-JHyowqMiq7lbxMHI3nNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56FB5100C660;
	Wed, 22 Sep 2021 13:46:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03FA85D9DC;
	Wed, 22 Sep 2021 13:46:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 791DA4E58E;
	Wed, 22 Sep 2021 13:46:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18MDkeng025693 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 Sep 2021 09:46:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B66FD5D9DD; Wed, 22 Sep 2021 13:46:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEDAA5D9DC;
	Wed, 22 Sep 2021 13:46:37 +0000 (UTC)
Date: Wed, 22 Sep 2021 08:46:36 -0500
From: David Teigland <teigland@redhat.com>
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <20210922134636.GB6605@redhat.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
	<20210920175736.GA19901@redhat.com>
	<d8d58ce5-6a38-9b76-8b9c-8e52e8760681@suse.com>
	<20210921135404.GA27196@redhat.com>
	<36d545a4-0551-6ab4-42da-0816020c4da6@suse.com>
MIME-Version: 1.0
In-Reply-To: <36d545a4-0551-6ab4-42da-0816020c4da6@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, zzhou@suse.com
Subject: Re: [Cluster-devel] [RFC PATCH dlm 00/10] dlm_controld config
	settings can be
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 22, 2021 at 05:32:49PM +0800, heming.zhao@suse.com wrote:
> If there is no chance to add dynamic updating setting by run command.
> Is it a good idea to add a parameter "-I", like "dlm_tool -I reload_config".
> "-I" means directly change without reading from dlm.conf.
> When users want to restore the original setting, run "dlm_tool reload_config"
> (without "-I") to override with predefined/default values.

How about "dlm_tool set_config x=y" to make a temporary change in
dlm_controld, and "dlm_tool reload_config" to reread dlm.conf.
Dave

