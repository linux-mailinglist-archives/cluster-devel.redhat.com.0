Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8F32F1E8325
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 18:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590768434;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2QkBQ1hsW65ifs+T38dQCXySbtszUd8Dh1ih5qIb6ac=;
	b=UXrZqdynkflgFPfzgZ+6KKASloy7h5MheMWFVUfRTq0Hofhhs97z9ZnLgZkI63ftJkgpHG
	RhX7/DEvGSUD1JJPoMn09ZGuCc+gEjccWuz9mHbbfU69tL1ti1sTAUmMsSPTVUHIxSt9Ni
	HlNE8dgrwkXZ8KMLjH/bEfZci0+Ly4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-Q94D5Hu0M4utMdPpjOuRSw-1; Fri, 29 May 2020 12:07:12 -0400
X-MC-Unique: Q94D5Hu0M4utMdPpjOuRSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D78B1800D24;
	Fri, 29 May 2020 16:07:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A58E7A8C3;
	Fri, 29 May 2020 16:07:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A75C1809543;
	Fri, 29 May 2020 16:07:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TG77dr026060 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 12:07:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78BCAF5AC9; Fri, 29 May 2020 16:07:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 747D2F5AC8
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 16:07:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A0CB80015D
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 16:07:04 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-397-ntMR-xJWN0-toQr3vUZvXg-1; Fri, 29 May 2020 12:06:59 -0400
X-MC-Unique: ntMR-xJWN0-toQr3vUZvXg-1
Received: by mail-qk1-f194.google.com with SMTP id w3so2651246qkb.6
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 09:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=2QkBQ1hsW65ifs+T38dQCXySbtszUd8Dh1ih5qIb6ac=;
	b=mGBzPP3DwRjy7rUI/w04Z82JX5dP4zovcJ4ZYMHN6KDzTk9ue5SLlP+sc17J1BR1yS
	iCQPoHSaEKIL2Smm/CylhN0jAlXkLn9DInxsPMw4tQ8OJEYFDp+2xroJ4UHzQ8QFFH/n
	HL94xZOQjH08gHKB8LgCkKz+osJqCEJ9oLO+fSTfzKAB6MnoclAr97Y8Vb4/UshGQp3G
	YEgJc25qptpJCjcpXQxsqoE6uk5aBO8/0PEgVOabsAsNydJbVUr/GVi2lMX8E4Fg0QLg
	ewyBOn5q+jcenYNoRdg+P3VOeio+xBF14opBHPhIqttvr5Ne8OqIEy+LvVFRDOauBAxY
	ZtVQ==
X-Gm-Message-State: AOAM5313JMDHy5RTV1YfxOMaHfZOluLgg1NYQUmSW+yrn/t6RjdTVa8W
	esP+qluyv66Hk9pZJKUu06o=
X-Google-Smtp-Source: ABdhPJwMyl4MP7h2HUGz7QIi8xuwkpyEvWtq9gcbO4jTClNrEKWMsNO9bid5iODsnfpoxy8FDRo4NQ==
X-Received: by 2002:ae9:e10f:: with SMTP id g15mr8822930qkm.285.1590768418954; 
	Fri, 29 May 2020 09:06:58 -0700 (PDT)
Received: from localhost.localdomain
	([2001:1284:f013:516d:2604:bfa5:7157:afa1])
	by smtp.gmail.com with ESMTPSA id
	j90sm8034447qte.33.2020.05.29.09.06.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 May 2020 09:06:58 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id C434AC1B84; Fri, 29 May 2020 13:06:55 -0300 (-03)
Date: Fri, 29 May 2020 13:06:55 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200529160655.GJ2491@localhost.localdomain>
References: <20200529120943.101454-1-hch@lst.de>
	<20200529120943.101454-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200529120943.101454-4-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, netdev@vger.kernel.org,
	Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	linux-sctp@vger.kernel.org, David Laight <David.Laight@aculab.com>,
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Cluster-devel] [PATCH 3/4] net: add a new bind_add method
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 02:09:42PM +0200, Christoph Hellwig wrote:
> The SCTP protocol allows to bind multiple address to a socket.  That
> feature is currently only exposed as a socket option.  Add a bind_add
> method struct proto that allows to bind additional addresses, and
> switch the dlm code to use the method instead of going through the
> socket option from kernel space.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>

Even though checkpatch complained about bad alignment here:
> +static int sctp_bind_add(struct sock *sk, struct sockaddr *addrs,
> +		int addrlen)

