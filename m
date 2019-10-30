Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 41DE6E9A71
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Oct 2019 11:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572432910;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h1zoKNArGUm4Ae+0qAlnUsDl1nnWctgcpUeif/rr9Kw=;
	b=A6YxbyiXFF9zQ0WOlv72faK7e7LLaMfQdLxY82souGQULDLvDMGP0JmfBizquWT8dr0SYf
	VV0VQi9fwjgUPWJujtIWPhHfRy7s6Lvy0dHiGyV6JdixTX2ohTTorlF2ftSSXAGKnDIIT1
	bussV2zgAYgyioPRlyoR6rwxHLvM954=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-KkviHFMYNN-WJLmhSbHyVw-1; Wed, 30 Oct 2019 06:55:09 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C438F1800D56;
	Wed, 30 Oct 2019 10:55:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D005A600C8;
	Wed, 30 Oct 2019 10:55:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0871C180880C;
	Wed, 30 Oct 2019 10:55:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9UAsw0b017909 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 30 Oct 2019 06:54:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D486393B; Wed, 30 Oct 2019 10:54:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57D0A19488
	for <cluster-devel@redhat.com>; Wed, 30 Oct 2019 10:54:55 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3198285363
	for <cluster-devel@redhat.com>; Wed, 30 Oct 2019 10:54:55 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id u16so1195269lfq.3
	for <cluster-devel@redhat.com>; Wed, 30 Oct 2019 03:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qtCKRSOH2wHBPxYWft32/SnJnhtK6FCm3n3b1weS2iw=;
	b=jdOjbqoB9nXJvIGAR3AUldPSMOHtzW99Pquxm9p6D5yMrcW2SHGPvgqjJ6/W9FfnrR
	DsWGAjemd9YV5eIsQIlpHXElP6XmfJoxrx94pdGhPYf4rK3b76YonPTH9zdgPEH4Us4m
	QeR0Cpp/AfgrHqBhxru4ArRKVaecsplJbcpkfMTjpuDKwvYL2z1MDSRj1PpriJiI/zii
	gnAdtK9PI5bm4i2ig2u+7v7EyICeckQg/eTzG9FfpeHTJ+usJcrsjXOE+70l9Z+8uCO0
	KosMkJ91YDqjkP8lntKj11dC5sG1vp1DyykoqKViyOB9/6UpGOwrfKDmm4oEncZ7h+7I
	5/0g==
X-Gm-Message-State: APjAAAWpq58KOGY/AC3vzIV/e4sPVIACjya1uMuC/hJbfXvMtgRx0GOz
	e4x9FkXPRWENO3+iURsqrJOgkPUgYfI12Q==
X-Google-Smtp-Source: APXvYqwsatGk18HzweXhyixLipLAb/Mv9X/MH9HKJPW7rZAVcuqCgzvKDo2oJGYecsvSvOfo66zYIA==
X-Received: by 2002:ac2:5328:: with SMTP id f8mr2409015lfh.128.1572432893347; 
	Wed, 30 Oct 2019 03:54:53 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
	[209.85.167.46])
	by smtp.gmail.com with ESMTPSA id m24sm877449ljg.51.2019.10.30.03.54.52
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 30 Oct 2019 03:54:52 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id f4so1181234lfk.7
	for <cluster-devel@redhat.com>; Wed, 30 Oct 2019 03:54:52 -0700 (PDT)
X-Received: by 2002:a19:6f0e:: with SMTP id k14mr5783119lfc.79.1572432891872; 
	Wed, 30 Oct 2019 03:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <157225677483.3442.4227193290486305330.stgit@buzz>
	<20191028124222.ld6u3dhhujfqcn7w@box>
	<CAHk-=wgQ-Dcs2keNJPovTb4gG33M81yANH6KZM9d5NLUb-cJ1g@mail.gmail.com>
	<20191028125702.xdfbs7rqhm3wer5t@box>
	<ac83fee6-9bcd-8c66-3596-2c0fbe6bcf96@yandex-team.ru>
	<CAHk-=who0HS=NT8U7vFDT7er_CD7+ZreRJMxjYrRXs5G6dbpyw@mail.gmail.com>
	<f0140b13-cca2-af9e-eb4b-82eda134eb8f@redhat.com>
In-Reply-To: <f0140b13-cca2-af9e-eb4b-82eda134eb8f@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Oct 2019 11:54:35 +0100
X-Gmail-Original-Message-ID: <CAHk-=wh4SKRxKQf5LawRMSijtjRVQevaFioBK+tOZAVPt7ek0Q@mail.gmail.com>
Message-ID: <CAHk-=wh4SKRxKQf5LawRMSijtjRVQevaFioBK+tOZAVPt7ek0Q@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 30 Oct 2019 10:54:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Wed, 30 Oct 2019 10:54:55 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: 0.148  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Linux-MM <linux-mm@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Cluster-devel] [PATCH] mm/filemap: do not allocate cache pages
 beyond end of file at read
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
X-MC-Unique: KkviHFMYNN-WJLmhSbHyVw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 11:35 AM Steven Whitehouse <swhiteho@redhat.com> wr=
ote:
>
> NFS may be ok here, but it will break GFS2. There may be others too...
> OCFS2 is likely one. Not sure about CIFS either. Does it really matter
> that we might occasionally allocate a page and then free it again?

Why are gfs2 and cifs doing things wrong?

"readpage()" is not for synchrionizing metadata. Never has been. You
shouldn't treat it that way, and you shouldn't then make excuses for
filesystems that treat it that way.

Look at mmap, for example. It will do the SIGBUS handling before
calling readpage(). Same goes for the copyfile code. A filesystem that
thinks "I will update size at readpage" is already fundamentally
buggy.

We do _recheck_ the inode size under the page lock, but that's to
handle the races with truncate etc.

            Linus

