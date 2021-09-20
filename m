Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F10E44120E0
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Sep 2021 19:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632160742;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GsYXCv14oQ/S/z01No7E5NWWDCz51qrx35keMgr6hi8=;
	b=MxwiFRDTpUG6fjUXcLO48HBiEOKixmSxpdxYjT5kx+SIjIyNUeRAI+1eG059MRgP9T1VEe
	DrkyNlWW7c1x27Sf3UoreoZzRPTI6XB7bqQKasqbEpkLVwjiA94Xlr3HTCE4d9f/+WbZ+A
	M/ztI4mFcg9QTzvF79evGa5CO5HhP3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-fVjpCvM5PJyQS2LPo5Y74g-1; Mon, 20 Sep 2021 13:59:01 -0400
X-MC-Unique: fVjpCvM5PJyQS2LPo5Y74g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92E8584A5E4;
	Mon, 20 Sep 2021 17:58:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 711036B54E;
	Mon, 20 Sep 2021 17:58:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 038454EA2F;
	Mon, 20 Sep 2021 17:58:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18KHve40032496 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Sep 2021 13:57:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CFDAF5D9DC; Mon, 20 Sep 2021 17:57:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E75795D9D5;
	Mon, 20 Sep 2021 17:57:37 +0000 (UTC)
Date: Mon, 20 Sep 2021 12:57:36 -0500
From: David Teigland <teigland@redhat.com>
To: Heming Zhao <heming.zhao@suse.com>
Message-ID: <20210920175736.GA19901@redhat.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210919064322.1670-1-heming.zhao@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 19, 2021 at 02:43:12PM +0800, Heming Zhao wrote:
> This new feature gives dlm ability to change config settings dynamically.

Hi Heming,

Letting dlm_controld reload certain settings from dlm.conf makes sense,
but I'd like something more basic.  Let the user edit dlm.conf, then
run dlm_tool reload_config to tell dlm_controld to reread dlm.conf, and
apply new settings.  This doesn't involve remote nodes, it's all local.
If the user wants, they can make changes on other nodes the same way.  

(We don't need to touch the "run" extension, which I'd like to remove
some day since it doesn't really belong in the dlm.)

Dave

