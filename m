Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EF66640054C
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Sep 2021 20:49:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-tH6QGrlFN7Ou_Kbo-hA3Hg-1; Fri, 03 Sep 2021 14:49:03 -0400
X-MC-Unique: tH6QGrlFN7Ou_Kbo-hA3Hg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B245824FA6;
	Fri,  3 Sep 2021 18:49:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2980C5C1C5;
	Fri,  3 Sep 2021 18:49:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFBDB44A59;
	Fri,  3 Sep 2021 18:49:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 183Ila9s018838 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Sep 2021 14:47:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DA5F20C15D5; Fri,  3 Sep 2021 18:47:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6923620C1665
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 18:47:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E83910AF7C2
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 18:47:33 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-158-QgRWlvePPSKXaGBguMn0rQ-1; Fri, 03 Sep 2021 14:47:31 -0400
X-MC-Unique: QgRWlvePPSKXaGBguMn0rQ-1
Received: by mail-lf1-f43.google.com with SMTP id x27so144842lfu.5
	for <cluster-devel@redhat.com>; Fri, 03 Sep 2021 11:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DxQ+Qr7YPaLGE685i8Qhsb70C5/CP3uq+dG10rbYZ70=;
	b=ai0mlebj88FhyZBHFfEbkI4nb61uVLpMo3gfFPGISH6p06AWnTB3snaJ7tMgM70JCh
	rfriOncyzi7OXdYJrG+tPU/DPHFMOJiLsQQ/JvBgnzpbecdGlgJb+ju+HsVV6PGLi9lY
	1LQtCbVwjqW2WeVhO6bvzIuhMaZwgvBf1NRkmLtt5bCeLQeAqW5MWE/fiYjY2nrrDCqk
	XXiC30QHSKbY5zuzjO3NGGe/Ok+ORagyT1asZlzk7ighaBVhV8wS8Ym+9hKhIUttEfRd
	f96DzWyq93hWY6Kx0I9PMwHadIlAnxNLtZW3ShXbeecnYRHnjKsFsV7FtlZpHTScH0Q/
	MBrg==
X-Gm-Message-State: AOAM533FGsAI5gbjSNbfR6HA4Mcwybmzs/D5pC/kGpcGOpRlTQvxB0Et
	KwSyrXIu8qnaXLp+boa0pmz6Jni3Sg99y6BGUxA=
X-Google-Smtp-Source: ABdhPJwRnQqjMOive/eMlhwO+m/BarzY6EI8xp5JCjlqIzulikdnbDyik1bRSCegIAjpH/O7jja5zg==
X-Received: by 2002:ac2:4e0f:: with SMTP id e15mr229397lfr.565.1630694849758; 
	Fri, 03 Sep 2021 11:47:29 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
	[209.85.167.41])
	by smtp.gmail.com with ESMTPSA id z1sm21980lfu.222.2021.09.03.11.47.28
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 03 Sep 2021 11:47:29 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id p38so229855lfa.0
	for <cluster-devel@redhat.com>; Fri, 03 Sep 2021 11:47:28 -0700 (PDT)
X-Received: by 2002:a05:6512:3987:: with SMTP id
	j7mr269355lfu.280.1630694848707; 
	Fri, 03 Sep 2021 11:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<CAHk-=wiUtyoTWuzroNJQwQDM9GHRXvq4974VL=y8T_3tUxDbkA@mail.gmail.com>
	<CAHc6FU7K0Ho=nH6fCK+Amc7zEg2G31v+gE3920ric3NE4MfH=A@mail.gmail.com>
	<CAHk-=wjUs8qy3hTEy-7QX4L=SyS85jF58eiT2Yq2YMUdTFAgvA@mail.gmail.com>
	<YTJoqq0fVB+xAB7w@zeniv-ca.linux.org.uk>
In-Reply-To: <YTJoqq0fVB+xAB7w@zeniv-ca.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Sep 2021 11:47:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=whVNs=67KdMg21wxQdKuOJNg2p3d9t6dX-u3Jw+tzxjoQ@mail.gmail.com>
Message-ID: <CAHk-=whVNs=67KdMg21wxQdKuOJNg2p3d9t6dX-u3Jw+tzxjoQ@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, kvm-ppc@vger.kernel.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 00/19] gfs2: Fix mmap + page fault
	deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 3, 2021 at 11:28 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> FWIW, my objections regarding the calling conventions are still there.

So I'm happy to further change the calling conventions, but by now
_that_ part is most definitely a "not this merge window". The need for
that ternary state is still there.

It might go away in the future, but I think that's literally that: a
future cleanup. Not really related to the problem at hand.

              Linus

