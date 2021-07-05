Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 342B93BC13C
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Jul 2021 17:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625500307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=94h8HuvsNXIPuzkfFYVmJcfX+faEonOANTvfeqnyEF4=;
	b=XhqjhyLBazysAgKj44GhgOiirnhwOcjwro3ifU+kc8kwv49NOrDsvJj6PVHTfjTAUkMn0Z
	fwphAWq/QKhq5PUc+Ki0W8FMXjmO2UuBy/P1mWL/zx/ta9ZgWPBPb8AlpUmoqWNXZotNxY
	TvJlJWFyjRRF5CXIrzsDLidWmkl0l8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-Eu09UAMjPZKNfoB5MX7yrQ-1; Mon, 05 Jul 2021 11:51:45 -0400
X-MC-Unique: Eu09UAMjPZKNfoB5MX7yrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 700FD100C660;
	Mon,  5 Jul 2021 15:51:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A2EC5D6A1;
	Mon,  5 Jul 2021 15:51:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DEBB4EA29;
	Mon,  5 Jul 2021 15:51:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 165FpftV001498 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Jul 2021 11:51:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 688014407F; Mon,  5 Jul 2021 15:51:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 625B644054
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:51:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DB27805C1D
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:51:36 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-505-fYCAKkCMOMmn3v9Kp8NeTg-1; Mon, 05 Jul 2021 11:51:34 -0400
X-MC-Unique: fYCAKkCMOMmn3v9Kp8NeTg-1
Received: by mail-wm1-f72.google.com with SMTP id
	m6-20020a05600c4f46b0290205f5e73b37so128465wmq.3
	for <cluster-devel@redhat.com>; Mon, 05 Jul 2021 08:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=94h8HuvsNXIPuzkfFYVmJcfX+faEonOANTvfeqnyEF4=;
	b=MWeza0K10nqTKastjf0ELHgoA7VmEViXZWc9BhXZIqfdSZu2MXaJ3lRBmo/XYDPtbC
	OIm94jF91eijYCNvuBPldqkECjuQilZFTPK9AAOMVRk1VbRvUTFncfNY4yyxXtxtbWt5
	ulHdDeOCi7IXiqJJBGSltfBdYo46PmDOmiNMULGNdrr+iOvFqyg4zTH1ua+9AfvkX5eR
	Vzx5fsKmCAMxMi6ui3nFAaKa5Vf+f3DJ7uXBbIiLCveBvsvoQTj1x+S7ZhcxK+YoXKJA
	aXT/IQ9hHHwa+Cqun7is+rtvKtnPTW853aZrSPFoNqLvmxxm9ooEHO6JAhO8kfOt0Z0/
	jIew==
X-Gm-Message-State: AOAM531R7rfPOptDc3Bf3Nw+ehU0MsWrl+tw0DVasxZyDHnwjZSnWLJx
	d6pGVWL8BR1d0E+a/IAhq3+3OiM0ketVtBuidgCZM2kgSE1+WsjXv/eMGuYV4O6bfQ9pJQCrUHz
	q/ppn9yrsonzzNAr0TF2SUrq17SoDS0xwBx1gNg==
X-Received: by 2002:a7b:c40d:: with SMTP id k13mr15673002wmi.97.1625500293825; 
	Mon, 05 Jul 2021 08:51:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt0xgTY8Fc/m6wSLIkQmnvuBGTo0ib6uAwtg1dnYqClFwZpSqUixG70VxfLezXErN7AKL1pIfnEj+ourL3X3M=
X-Received: by 2002:a7b:c40d:: with SMTP id k13mr15672989wmi.97.1625500293712; 
	Mon, 05 Jul 2021 08:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210628172727.1894503-1-agruenba@redhat.com>
	<YNoJPZ4NWiqok/by@casper.infradead.org>
	<YNoLTl602RrckQND@infradead.org>
	<YNpGW2KNMF9f77bk@casper.infradead.org>
	<YNqvzNd+7+YtXfQj@infradead.org>
	<CAHc6FU7+Q0D_pnjUbLXseeHfVQZ2nHTKMzH+0ppLh9cpX-UaPg@mail.gmail.com>
In-Reply-To: <CAHc6FU7+Q0D_pnjUbLXseeHfVQZ2nHTKMzH+0ppLh9cpX-UaPg@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 5 Jul 2021 17:51:22 +0200
Message-ID: <CAHc6FU6NWgVGPkvLM_mb+TpK3aM2BK+RrLgKgfS20kCLVV=ECg@mail.gmail.com>
To: "Darrick J . Wong" <djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 0/2] iomap: small block problems
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
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 30, 2021 at 2:29 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> Darrick,
>
> will you pick up those two patches and push them to Linus? They both
> seem pretty safe.

Hello, is there anybody out there?

I've put the two patches here with the sign-offs they've received:

https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/log/?h=for-next.iomap

Thanks,
Andreas

