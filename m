Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BE97F4134E0
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Sep 2021 15:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632232457;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=IYj2yJtzSEsMraYp7ozj0CyM6kH+gzxLmYXET2vVZxc=;
	b=ebOW879wO4tk6W9hBl8lDL+aFikb4r5uv88EEk9n7kOANKCSYkcH1EAq6YF29TxZuBm5xJ
	DS24qSGnLVVBfF8llgCHrzBDnTexXIlDjGmZe+ByZZEsJwnLa56L3lnIyNVNzEXF1ngMdR
	p5iZdrTDYZ7I0RGBak79Yu9a63m8iK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-VkV8De68M02rAfyw9iIq_g-1; Tue, 21 Sep 2021 09:54:16 -0400
X-MC-Unique: VkV8De68M02rAfyw9iIq_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 847A2101F7A8;
	Tue, 21 Sep 2021 13:54:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D337F6A912;
	Tue, 21 Sep 2021 13:54:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EBD91806D02;
	Tue, 21 Sep 2021 13:54:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18LDs76T005146 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Sep 2021 09:54:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2746F60938; Tue, 21 Sep 2021 13:54:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B562660877;
	Tue, 21 Sep 2021 13:54:06 +0000 (UTC)
Date: Tue, 21 Sep 2021 08:54:04 -0500
From: David Teigland <teigland@redhat.com>
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <20210921135404.GA27196@redhat.com>
References: <20210919064322.1670-1-heming.zhao@suse.com>
	<20210920175736.GA19901@redhat.com>
	<d8d58ce5-6a38-9b76-8b9c-8e52e8760681@suse.com>
MIME-Version: 1.0
In-Reply-To: <d8d58ce5-6a38-9b76-8b9c-8e52e8760681@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Tue, Sep 21, 2021 at 02:38:45PM +0800, heming.zhao@suse.com wrote:
> But I am ok with the reload_config idea, it's more basic.
> We could give dlm_controld a chance to change behavior on the fly.
> If needed, I could file a new patch for feature "reload_config", can I do it?

Yes, I'd welcome a patch adding a dlm_tool reload_config option to reread
dlm.conf and apply new settings from it.
Thanks,
Dave

