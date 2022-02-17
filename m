Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1E4BA393
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Feb 2022 15:51:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645109480;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=iFIl01/BQ/Dy4ZWwrGAge9I84eL/Lvozhpv4NqT00tw=;
	b=dwDmdX+ke+wxBiFlzude5La5MIeROgwSxphHSJMb7nMD6z0agqPCFPx2LxdqjAZw1+wJ8x
	C+EoQGQ7B/Bj2kjhd7pS6CPeyQDO9ehi8vGZ3DnrSWx3ZkwQCKokX1hApOs3a7Y54d3Fq8
	ZOQo6odh7ySBshtnDJWZc7d5OEimH8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-TjqC3q8LPjG9Ijo_c4dcMA-1; Thu, 17 Feb 2022 09:51:17 -0500
X-MC-Unique: TjqC3q8LPjG9Ijo_c4dcMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D652A801AC5;
	Thu, 17 Feb 2022 14:51:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 630F82B6C8;
	Thu, 17 Feb 2022 14:51:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C109C4CA93;
	Thu, 17 Feb 2022 14:51:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HElotK012095 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 09:47:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC0EE14582F9; Thu, 17 Feb 2022 14:47:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D843E14582F7
	for <cluster-devel@redhat.com>; Thu, 17 Feb 2022 14:47:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C27EA185A7A4
	for <cluster-devel@redhat.com>; Thu, 17 Feb 2022 14:47:49 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-453-X0BnnU6nMauDN_nSWm8dZA-1; Thu, 17 Feb 2022 09:47:48 -0500
X-MC-Unique: X0BnnU6nMauDN_nSWm8dZA-1
Received: by mail-wm1-f71.google.com with SMTP id
	n3-20020a05600c294300b0037bc685b717so1771540wmd.8
	for <cluster-devel@redhat.com>; Thu, 17 Feb 2022 06:47:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iFIl01/BQ/Dy4ZWwrGAge9I84eL/Lvozhpv4NqT00tw=;
	b=2YQNDMlEZX+pjrDzEbQeAGx00ig4vHliiRK3RCLBmAdazqDV+3u12ogdB/gDG8cPIq
	LXGhvaq8VXdLqs2/U0WwX6nFeg6AnLIAVeV+ZOtlURHH89sV79Ew1wgA4RcWUfaQ6bkJ
	w3FD9B3S6j1q4OZojTtPfiPSvsKgK0YYgMzgHfFJe0vRcZenBR6rPhTaiivLtUmJc9Hw
	3FUTCbHf9OLS7UvuCSqT+gvk5msZH6f9eLm+Py8x1aDrV+TrRS+jFHAOfM5qu0JTQkby
	vrI9TWRg2A3aDr3I4VoKuxFFO3m1g5UwIxm6ju33X07y9iOMe7BGm3zoJ8wFrI5is0NC
	8BnA==
X-Gm-Message-State: AOAM531eaqHtxW30X/sYFqQLbExP6LKTWT3MTfE6L1b7FPWHfO6yDfUR
	ABGL9xAaczsvn0UsR0o8rADbvtfDp4csiHiTNrRjXkw8OeCnkHR9bXF2Se2LBFTyH/IZ3cAtTg9
	b6doVwFUeanIWqKdQyNFlAkcuissyrpFAYszt8Q==
X-Received: by 2002:a05:600c:2f01:b0:37b:aa49:3864 with SMTP id
	r1-20020a05600c2f0100b0037baa493864mr3035422wmn.74.1645109267119;
	Thu, 17 Feb 2022 06:47:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVtJ0O4Zgk2U0gxPYL9QSv4jjVcaeDPARZguOvKP7RMzNeG8PUPFqtOjwTHIEJ2QS6/h4iENyVztiY6Pz+4/Y=
X-Received: by 2002:a05:600c:2f01:b0:37b:aa49:3864 with SMTP id
	r1-20020a05600c2f0100b0037baa493864mr3035406wmn.74.1645109266815;
	Thu, 17 Feb 2022 06:47:46 -0800 (PST)
MIME-Version: 1.0
References: <20220216155307.2994688-1-aahringo@redhat.com>
	<20220216155307.2994688-2-aahringo@redhat.com>
	<CAHc6FU77jwdsDv_FGCFxrUVn_DOEqGrKEkB8c7N2pAF_j5Xo+A@mail.gmail.com>
	<CAK-6q+id1tmHL2GXBqOsJh53pbyH5rdTAgLeXdqUj4D6kZvkow@mail.gmail.com>
	<CAHc6FU4yypWqE+BZx4AstMYHkzoSDV5jVndYY7jYk7L1v20isg@mail.gmail.com>
	<20220217004142.551299-1-agruenba@redhat.com>
	<CAK-6q+jKKr3hx29QMmz9jgoBNhs0NiyCEC8czYvg55dDr6Kkjw@mail.gmail.com>
In-Reply-To: <CAK-6q+jKKr3hx29QMmz9jgoBNhs0NiyCEC8czYvg55dDr6Kkjw@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 17 Feb 2022 15:47:35 +0100
Message-ID: <CAHc6FU4f34yutmcBA-GrZPUwjTgMAXBHuCzzFpMP_=cWQ-k3pQ@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH dlm/next 1/4] fs: dlm: replace sanity
 checks with WARN_ON
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 17, 2022 at 3:03 PM Alexander Aring <aahringo@redhat.com> wrote:
> On Wed, Feb 16, 2022 at 7:41 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > There's also an unnecessary INIT_LIST_HEAD() in send_op().
> >
>
> please send a patch in a form which makes it easy to apply. Also
> please explain exactly why an "INIT_LIST_HEAD()" is not needed here
> rather than just stating that the init isn't needed.

The reason why the INIT_LIST_HEAD is unnecessary is because it
initializes op->list, and two lines further down, the list_add_tail
overrides op->list.

Do with this report whatever you want, but don't expect me to spend
extra time on it.

Andreas

