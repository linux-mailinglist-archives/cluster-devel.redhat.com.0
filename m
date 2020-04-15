Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AC84E1AAADC
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 16:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586962360;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1kDbnhqGtMqjG8lQXCk80CQmsrtdvPEc5fw6ACqAyhw=;
	b=gWM+rcGdQEGKwEZLOiaDzkFq2FkgHDFWo+VYg0UkRTL+6bCg8eloCPfZ4WYp7DGC7AGj/C
	FBGY5OgHj5kqg8YIE8JOF6U+o81y9j9Yq2zBQ1larNDGQNH1VarZVi3uVDAHkXf6Mk8zqM
	3yVeSJT475i4eOd/ZHUe13nzifJbjtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-cSnkGwaEM6uJLq36QJxjbw-1; Wed, 15 Apr 2020 10:52:38 -0400
X-MC-Unique: cSnkGwaEM6uJLq36QJxjbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 834D11005513;
	Wed, 15 Apr 2020 14:52:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28524A0986;
	Wed, 15 Apr 2020 14:52:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AA6893065;
	Wed, 15 Apr 2020 14:52:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FEqWJ9007678 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 10:52:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA4201069F58; Wed, 15 Apr 2020 14:52:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B69F21069F57
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 14:52:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 113D5800A1A
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 14:52:30 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
	[209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-399-ccC5WRINNjO5jEvUI-7vDA-1; Wed, 15 Apr 2020 10:52:28 -0400
X-MC-Unique: ccC5WRINNjO5jEvUI-7vDA-1
Received: by mail-oi1-f198.google.com with SMTP id u64so13163934oie.22
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 07:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1kDbnhqGtMqjG8lQXCk80CQmsrtdvPEc5fw6ACqAyhw=;
	b=KIafs1oJc8nlUmd2b95vZaoHA28/+OGH+74mCnHOWnPAsrNd723R9qccJRIJ70rqyK
	1TEcyz/JRtrYFlqBhslmEU8Zn6P1AkK0ziUxOsnizDsZ65zB09U4klCi9StuDmnpO9Fk
	kggOu/SKt6pLcc9uqxWDFUxg/24N7xOGnhcU4TUL+eq+pJKTAX/K81clh+WB9QfAkjY/
	zJnYCqpCkP5zTIBDlxpibQizfvuQA/cwULQaqizuV/1sWy56qnH82G67IfEtkdwifYfz
	okpQexfHzzFYw0HJtFEcNUmu5zeHePazMsdzN1lR4eUSzsoyMO2UzdByBRpyJiylFPFQ
	FaZQ==
X-Gm-Message-State: AGi0PuYFB34ivexY9RwS9yNPq/FVR7JA20LVzEuArmUxv1/vbVFEIyOU
	hdvhbjWtY64Y+JbP7EnIiXwYY1Cu7DerHdrwOFXXSuwZ5oOwTc3WUJAd6PMnDMonnILRqQ6EsnQ
	T5L54lBbCnfNcFSvdOoL5MHCN0T548QnNUun+8Q==
X-Received: by 2002:a9d:de2:: with SMTP id 89mr2906543ots.95.1586962347556;
	Wed, 15 Apr 2020 07:52:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypLmVmCktd00qieZfjc3BOKQ5/p1IiZjFTHz+lHTkbXBFkFLjMuioL0TxwltuaXwGoF4kLCbcx9/6KoorQ3tcig=
X-Received: by 2002:a9d:de2:: with SMTP id 89mr2906526ots.95.1586962347345;
	Wed, 15 Apr 2020 07:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586960617.git.mchehab+huawei@kernel.org>
	<e146506222bf13e8ef7008ac8b4547172c2faad8.1586960617.git.mchehab+huawei@kernel.org>
In-Reply-To: <e146506222bf13e8ef7008ac8b4547172c2faad8.1586960617.git.mchehab+huawei@kernel.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 15 Apr 2020 16:52:16 +0200
Message-ID: <CAHc6FU7AKuXMtyYduqd5POOmi6nOLbi6_usmS_Jk3eJ-bK568w@mail.gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03FEqWJ9007678
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 18/34] docs: filesystems: convert
	gfs2-glocks.txt to ReST
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

I've pushed this to for-next.

Thanks,
Andreas


