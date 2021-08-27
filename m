Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B7FAF3F9F60
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 20:59:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-zx6nWbHFMH6XMqOOycJyrQ-1; Fri, 27 Aug 2021 14:59:14 -0400
X-MC-Unique: zx6nWbHFMH6XMqOOycJyrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E3A4107B7C3;
	Fri, 27 Aug 2021 18:59:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C4CB100EBB8;
	Fri, 27 Aug 2021 18:59:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5148E4BB7B;
	Fri, 27 Aug 2021 18:59:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RIvhO0016474 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 14:57:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB52210CD2D2; Fri, 27 Aug 2021 18:57:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D77FE119D322
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 18:57:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AA6D101A529
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 18:57:41 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-286-KCQTDJE7Moaagk1OCIq7QA-1; Fri, 27 Aug 2021 14:57:39 -0400
X-MC-Unique: KCQTDJE7Moaagk1OCIq7QA-1
Received: by mail-lf1-f45.google.com with SMTP id c8so3764518lfi.3
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 11:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YxxLEk/XSr4w+re4v3pBg80KnJK57H4H8Qpi3MkYDbY=;
	b=X2gCBqtQJ+aAdalfd3ErN/brAC/n13ztnYmJdPT4sLgnDqsyyaXjsllAOOHCkE05Ho
	mfm+2uB+7qfhp8hJJ+bxq9/LPAxJs1BtnG+pJV5cbQA7nwjeR9OKG+HbJ7prylCqph+N
	nLQsid9BOXoc90mJuljht+r2Hr8b6aTjLgtR+kEnwxD2ryyTVLtE4mHAZ2B5nMi/WxEE
	SSipThN7oYNIdfd/oNmq3zI0TD0mYGpOrCRqCATx9gZt7XvgnuBY2Itc1TZwFE9wC/sl
	8g9wTtVYO2zvXU41wQQtvjPcNRTrZHyRxZ/Fy+/4o8nudSTEUGpRKCaaANY8Tx5cnuaR
	ejXg==
X-Gm-Message-State: AOAM530uRHWszI9wiXELiJQwMZ4IqFk8ml3afA7wIXwAcDoK54zlBT8V
	hTbIWa/l6ubvQllqNwjxh3L7cW4F43RMGL9X
X-Google-Smtp-Source: ABdhPJz+EVuiDXBfzRz/W0ilH1wR7inw/G/YnZ9SMCmzqatPUoLmXT4z4EH/a+Heuzf2euuRyg+b6Q==
X-Received: by 2002:ac2:51d9:: with SMTP id u25mr7984422lfm.541.1630090656668; 
	Fri, 27 Aug 2021 11:57:36 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
	[209.85.208.182])
	by smtp.gmail.com with ESMTPSA id b17sm773746ljj.35.2021.08.27.11.57.35
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 27 Aug 2021 11:57:36 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id y6so13163608lje.2
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 11:57:35 -0700 (PDT)
X-Received: by 2002:a2e:944c:: with SMTP id o12mr8723398ljh.411.1630090655578; 
	Fri, 27 Aug 2021 11:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-5-agruenba@redhat.com>
	<YSk0pAWx7xO/39A6@zeniv-ca.linux.org.uk>
In-Reply-To: <YSk0pAWx7xO/39A6@zeniv-ca.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Aug 2021 11:57:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj8Q6PtnQqamACJU1TWpT4+nr2+YGhVwMTuU=-NJEm5Rg@mail.gmail.com>
Message-ID: <CAHk-=wj8Q6PtnQqamACJU1TWpT4+nr2+YGhVwMTuU=-NJEm5Rg@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 04/19] iov_iter: Turn
	iov_iter_fault_in_readable into fault_in_iov_iter_readable
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 11:53 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> I really disagree with these calling conventions.  "Number not faulted in"
> is bloody useless

It's what we already have for copy_to/from_user(), so it's actually
consistent with that.

And it avoids changing all the existing tests where people really
cared only about the "everything ok" case.

Andreas' first patch did that changed version, and was ugly as hell.

But if you have a version that avoids the ugliness...

             Linus

