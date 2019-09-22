Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7CEBA203
	for <lists+cluster-devel@lfdr.de>; Sun, 22 Sep 2019 13:27:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADEE48980FF;
	Sun, 22 Sep 2019 11:27:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47CC95C1B5;
	Sun, 22 Sep 2019 11:27:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EC8C1803517;
	Sun, 22 Sep 2019 11:27:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8MBRANX001625 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Sep 2019 07:27:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB505600D1; Sun, 22 Sep 2019 11:27:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E52A9600CD
	for <cluster-devel@redhat.com>; Sun, 22 Sep 2019 11:27:08 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
	[209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41886C058CBD
	for <cluster-devel@redhat.com>; Sun, 22 Sep 2019 11:27:08 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id d206so3984680oig.6
	for <cluster-devel@redhat.com>; Sun, 22 Sep 2019 04:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f82s3PEPX+YiZFlFw4GEis5beZlkMEv4q9//Qd6Y9ac=;
	b=OTq+UK3M6U3KAH3ZdLF4rjLWxryHnhGRVnkrIH6K7QII6nG7usPNTr+a3uvS+hLFJg
	UuGAxFhfVq4Le3zHmrUniWq6ixctd+K+jCF4bSje7nZWYbwZTRoEl8kQxkhXH09jBX5z
	Z9zC/570ozicaacDPF15YOoNgZqK6KT7AjIH2K82U18FoiprMl2hd8gzsreqK1Uuv+LX
	2T65+r+X02Ffp6uFv2Ju8S9UkD1NEpZ8P5nTQaIcgFqnRHxulNnGMWELdNQ1t9Z9vzBG
	7N7mJnCAVsoHL+zunhl9lkG/tG9ScL72YMz3LcS8oSNCAEJWYwg9MnInrJEvnWlc6jqe
	AFNA==
X-Gm-Message-State: APjAAAVNw+DqqC2Zh6G2JfuLTrmLzmjwFjwe/mGW9QYWR7RBJt664oxs
	zi969S1sy07GHscyIyYnw2QELNaaVcsjaQvZI/kpN+7jspr4pfH9+xMYOuEW9Tfni01WJW00UFv
	tM7Dfe8NAefXNTHB9SlFMYGjfazDcQuPkkA0kXA==
X-Received: by 2002:aca:aa56:: with SMTP id t83mr10017553oie.178.1569151627470;
	Sun, 22 Sep 2019 04:27:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJhGdr7Y95ubTbD1L9lVtBYsPgC+YzmePQ0yH6b/ZhKK0zpow4/Llav9hYM4lAJqgL4o49n/gdZ7R1nFImSp8=
X-Received: by 2002:aca:aa56:: with SMTP id t83mr10017544oie.178.1569151627265;
	Sun, 22 Sep 2019 04:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190921165126.4443-1-agruenba@redhat.com>
	<CAHk-=whA0x5DLX14=hdAq4SukTs7WXsrNyLuqwiFbXJyYnmBcQ@mail.gmail.com>
In-Reply-To: <CAHk-=whA0x5DLX14=hdAq4SukTs7WXsrNyLuqwiFbXJyYnmBcQ@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sun, 22 Sep 2019 13:26:56 +0200
Message-ID: <CAHc6FU43MD1GAw8FiM_NWFmoojX5Hx-d2cFKPr3OtPOyc=nCyg@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 changes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Sun, 22 Sep 2019 11:27:21 +0000 (UTC)

On Sat, Sep 21, 2019 at 11:53 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Sat, Sep 21, 2019 at 9:51 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > please consider pulling the following changes for gfs2.
>
> Merged.

Thanks.

> But I notice that you're not getting any pr-tracker replies.
>
> I'd suggest you cc lkml to get the automatic notification in case you care,

Ok, good to know that's why I didn't hear from pr-tracker this time.

Thanks,
Andreas

