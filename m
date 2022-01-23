Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D04849749E
	for <lists+cluster-devel@lfdr.de>; Sun, 23 Jan 2022 19:42:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642963345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cY1U+lDZEduaUwZDUPPFY/UPA4Nbu9quyT81CXEx4PE=;
	b=WvYrpFrfIuIxT+Yq5RHjj1ytyLWdA5ECI1HA0sIPyPGk2dVg66kMUpN1IXkrD/NM+WPqTu
	hpSuxAJnGnjRPj0xqRJsehmpd+UIMtnW3VyuzM8BfXOKeZ50JSekdu6cmn3hIfLXtb0XxW
	5zjpQssZiQrIUumkfS2XqWbb0w4hhZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-ZpnZpryHMJqWpK9rHop8mw-1; Sun, 23 Jan 2022 13:42:21 -0500
X-MC-Unique: ZpnZpryHMJqWpK9rHop8mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A13061853020;
	Sun, 23 Jan 2022 18:42:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A61677C86;
	Sun, 23 Jan 2022 18:42:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B56A4A7C8;
	Sun, 23 Jan 2022 18:42:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20NIg75j025018 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 23 Jan 2022 13:42:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5733B401E37; Sun, 23 Jan 2022 18:42:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 526B5401E2A
	for <cluster-devel@redhat.com>; Sun, 23 Jan 2022 18:42:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07F473C01C1C
	for <cluster-devel@redhat.com>; Sun, 23 Jan 2022 18:42:07 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-315-6laagyR1MmqiWk1xmpa6BQ-1; Sun, 23 Jan 2022 13:42:03 -0500
X-MC-Unique: 6laagyR1MmqiWk1xmpa6BQ-1
Received: by mail-qk1-f197.google.com with SMTP id
	q5-20020a05620a0d8500b004738c1b48beso10550475qkl.7
	for <cluster-devel@redhat.com>; Sun, 23 Jan 2022 10:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cY1U+lDZEduaUwZDUPPFY/UPA4Nbu9quyT81CXEx4PE=;
	b=rrqvkiuNu7GgNLRpdHhN98Z8Zel8AgSkXIXXVIICk3Xo3OumtoLQ1d/i08yVKgDBzI
	D89ujyaiqtGVGtmf4a18Cmq478EgjZmYX2QhtmdlBeqM3NMw9NQuXzxW2bPXe4Fvno86
	pj4TQpgCZ751e7sz+FO5xgN8N39BgtX9nOhjv7ap8VCCwj+LxVpJKX0LXsMPYBGCWEgk
	Sbxe8XCosXkfGunGPRtEqTzcx6JXeGFJAJmd/pn8JQ46K+eUwYgeWVc5z+ZGup3TGHPl
	hb7D+d/mJ3dWZRpIv6WT56URQ+Fjlj3pMB0begAhlz92eUGBgeIwazasERBHnFN173Ig
	Afjg==
X-Gm-Message-State: AOAM532Eg0IQNM0uJxQ86HqcJSD0eWTbxXRxhtfshJGAnotCLxPj/3sT
	dHxHXGdUB+LKqAs0OzEUgWPl+wYpCsdCachyw8N1Hipcf4u0hhC7BuelYlnFsB++LkdvTVBwGDO
	cel0zsJGNLQxgaBiuch4PWwvu/3pKTHbT2HOSaQ==
X-Received: by 2002:ac8:7fce:: with SMTP id b14mr9929566qtk.339.1642963323222; 
	Sun, 23 Jan 2022 10:42:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgrnfftQev+/e1bfthcVXrqsS2NkZk7XaembGAyAtcFzDuZvrfItLL05jZqccEw/AGJEmBtbd/PLqLmStx2NU=
X-Received: by 2002:ac8:7fce:: with SMTP id b14mr9929550qtk.339.1642963322945; 
	Sun, 23 Jan 2022 10:42:02 -0800 (PST)
MIME-Version: 1.0
References: <202201221028.YKA8kSdm-lkp@intel.com>
	<CAK-6q+h_hb94J3DSXPk=E44kCxiwZ+BE3kMJe09iShRzMb=vzQ@mail.gmail.com>
	<91901e7b-7d82-116c-aaf2-c74c6a6b999c@infradead.org>
In-Reply-To: <91901e7b-7d82-116c-aaf2-c74c6a6b999c@infradead.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Sun, 23 Jan 2022 13:41:52 -0500
Message-ID: <CAK-6q+j2jc3pBmbvQ-DCmxveC-UMV75SFc2nC1zwXKe9wm4YPg@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: cluster-devel@redhat.com
Cc: rcu@vger.kernel.org, kbuild-all@lists.01.org,
	kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	cluster-devel <cluster-devel@redhat.com>, linux-sparse@vger.kernel.org
Subject: Re: [Cluster-devel] fs/dlm/midcomms.c:913:22: sparse: sparse:
 restricted __le32 degrades to integer
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

Hi Randy,

On Sat, Jan 22, 2022 at 2:19 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 1/22/22 10:28, Alexander Aring wrote:
> > Hi,
> >
> > On Fri, Jan 21, 2022 at 9:45 PM kernel test robot <lkp@intel.com> wrote:
> >>
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> >> head:   9b57f458985742bd1c585f4c7f36d04634ce1143
> >> commit: 658bd576f95ed597e519cdadf1c86ac87c17aea5 fs: dlm: move version conversion to compile time
> >> date:   3 months ago
> >> config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20220122/202201221028.YKA8kSdm-lkp@intel.com/config)
> >> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> >> reproduce:
> >>         # apt-get install sparse
> >>         # sparse version: v0.6.4-dirty
> >>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=658bd576f95ed597e519cdadf1c86ac87c17aea5
> >>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >>         git fetch --no-tags linus master
> >>         git checkout 658bd576f95ed597e519cdadf1c86ac87c17aea5
> >>         # save the config file to linux build tree
> >>         mkdir build_dir
> >>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash
> >>
> >> If you fix the issue, kindly add following tag as appropriate
> >
> > I have it on my list but it isn't easy to make sparse happy here...
> > this is the second time the robot reported this issue. Is there a way
> > to turn the robot off in that case?
> >
> > Maybe some human who reads that knows the answer?
>
> Hi Alex,
>
> In the source file, you can surround the "offending" line(s) with
>
> #ifndef __CHECKER__
>  ...
> #endif
>
> to prevent sparse from checking those lines.
> Sometimes there needs to be an "#else" branch also.
>
> 'git grep __CHECKER__' will show you quite a few other examples.
>

Thanks, I will try that to stop the false positives and endianness
warnings (temporarily).

I see also:

fs/dlm/midcomms.c:213:1: sparse: sparse: symbol
'__srcu_struct_nodes_srcu' was not declared. Should it be static?

For a macro which contains the "static" keyword, it's
"DEFINE_STATIC_SRCU()". Either sparse should be teached to deal with
that or everybody should use "static DEFINE_SRCU()" instead of using
"DEFINE_STATIC_SRCU()".
I would like to see the second way because everybody can see "static"
is being used, that means maybe we should remove
"DEFINE_STATIC_SRCU()"? The alternative by doing nothing would be to
use "#ifndef __CHECKER__".

I cc here rcu@vger.kernel.org and linux-sparse@vger.kernel.org, maybe
this can be discussed?

- Alex

