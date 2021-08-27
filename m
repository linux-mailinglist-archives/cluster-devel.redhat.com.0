Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2017C3F9D60
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 19:17:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-taWTqW_qNlO6Rry5B615hQ-1; Fri, 27 Aug 2021 13:17:08 -0400
X-MC-Unique: taWTqW_qNlO6Rry5B615hQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B342793923;
	Fri, 27 Aug 2021 17:17:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5F75D6D5;
	Fri, 27 Aug 2021 17:17:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04D984BB7B;
	Fri, 27 Aug 2021 17:17:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RHH2Cv008325 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 13:17:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9236516358D; Fri, 27 Aug 2021 17:17:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D437120EA3
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 17:16:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDCCD967604
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 17:16:59 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-596-liez8Wm3M9mWY9pZwTx72w-1; Fri, 27 Aug 2021 13:16:58 -0400
X-MC-Unique: liez8Wm3M9mWY9pZwTx72w-1
Received: by mail-lf1-f49.google.com with SMTP id c8so3225919lfi.3
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 10:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j79aTkkV7QWLMRm7gv45CG9ALkTrZZR1j0Lx/8G3d6o=;
	b=dA6xTfl7vIPIxVr5cyvouf8DOQ2LIUN18PLUUMfUUBDXgzxcO+q6+1cG0aNS29Fj+O
	MjrlqKQv9O6m8o3dwJeOIV0keBBo/6oXPQTVj0VJ2GatmY5C+Sw+XYZRwiTFgKjButk9
	piq2ITsyoEa9pFiNPGyBdOxE1oCYrb8mHJaBs9e0Km+5U2Tf9hL0sUcVUdKY+ZbXP0Cu
	PnuQwg/scUzqmQ3rVn2cbGZt9cNBUwsSAYSdlKRkyB/RR5CmybzvRnCf+xCtAZvhTDAX
	jSnKIP3eIP9aejRu/KpEeUFmRPPSJV4g+cMPhPBJmqLmrsPLLzzBD+Vu3uyTGMT53uSR
	aTkQ==
X-Gm-Message-State: AOAM533gok7Buj2APa8NKbVcb9B3BuN7ui0PNC1yy6tskFIrfih3vvT0
	xcmmgZAqpDmfEqvW2KABSUiSagk6LCsoIXIm
X-Google-Smtp-Source: ABdhPJwb7ZOY9yPD35YAE8vZ0wZllkRhjtVCYcr1x8tgEqPZIRmkELaN+C4IflKow63iSs6u5klMQw==
X-Received: by 2002:a05:6512:3ca5:: with SMTP id
	h37mr7440224lfv.247.1630084615873; 
	Fri, 27 Aug 2021 10:16:55 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
	[209.85.208.171])
	by smtp.gmail.com with ESMTPSA id h6sm702607lfu.230.2021.08.27.10.16.53
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 27 Aug 2021 10:16:54 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id f2so12691437ljn.1
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 10:16:53 -0700 (PDT)
X-Received: by 2002:a2e:3004:: with SMTP id w4mr8318181ljw.465.1630084613565; 
	Fri, 27 Aug 2021 10:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
In-Reply-To: <20210827164926.1726765-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Aug 2021 10:16:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiUtyoTWuzroNJQwQDM9GHRXvq4974VL=y8T_3tUxDbkA@mail.gmail.com>
Message-ID: <CAHk-=wiUtyoTWuzroNJQwQDM9GHRXvq4974VL=y8T_3tUxDbkA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 9:49 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> here's another update on top of v5.14-rc7.  Changes:
>
>  * Some of the patch descriptions have been improved.
>
>  * Patch "gfs2: Eliminate ip->i_gh" has been moved further to the front.
>
> At this point, I'm not aware of anything that still needs fixing,

>From a quick scan, I didn't see anything that raised my hackles.

But I skipped all the gfs2-specific changes in the series, since
that's all above my paygrade.

                 Linus

