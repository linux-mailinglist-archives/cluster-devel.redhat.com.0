Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6864DC257
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Mar 2022 10:09:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647508146;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=rEgtrLnyAIPwql7el4ksZ93xm8i72N7vX12uNHKsLPU=;
	b=NSsQV4Sb/WGwjCwXPf8H32xPv+PqmtddB97N+oPXEPYH5nXyxZ184DhKl1oF+dKVQZu+ST
	ORFZH6DS3IZkMDV0zxo44oSv/ld06MpA+IxYOz9E0++guChU84fruPQg0DnN15n0r2AZBw
	hU5XrJ5mFUZswLt6mlhh1/kGtMPwxZM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-F8xRxwS_Pr-xf2e1lsr8Xw-1; Thu, 17 Mar 2022 05:09:03 -0400
X-MC-Unique: F8xRxwS_Pr-xf2e1lsr8Xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDABA803D7C;
	Thu, 17 Mar 2022 09:09:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56D061427AFC;
	Thu, 17 Mar 2022 09:09:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EC6B5194036B;
	Thu, 17 Mar 2022 09:09:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4A250194035E for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Mar 2022 09:08:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2492656F7FD; Thu, 17 Mar 2022 09:08:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20B7056F7FB
 for <cluster-devel@redhat.com>; Thu, 17 Mar 2022 09:08:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08B96185A79C
 for <cluster-devel@redhat.com>; Thu, 17 Mar 2022 09:08:59 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-gogA7eVuNMegBL19IiRgWA-1; Thu, 17 Mar 2022 05:08:57 -0400
X-MC-Unique: gogA7eVuNMegBL19IiRgWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h127-20020a1c2185000000b0038c6f7e22a4so2014906wmh.9
 for <cluster-devel@redhat.com>; Thu, 17 Mar 2022 02:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rEgtrLnyAIPwql7el4ksZ93xm8i72N7vX12uNHKsLPU=;
 b=YbnteYUOOEU24GFI6FgXWWMkR1N0IOotpZLlUkLLubhNKQEU66yuUUcL1QLOve+oQJ
 Q7VUqC9wf/InyYZnUsyfeWwUHoAl5spUzZ7T6fMtaw2ojfl857r5WhDGkU67gWDBl28S
 N7r5jPZY6K1UfxUIDWsOU89+ZI8m61RSZDDWVomQTKIgeXWvjo1xLGPKTEpIFlzzdrRd
 sZy14zBwH4FwhK6ZRiuXeLnycFCCw2GQXNzA7iJQNqYoLB0liJaJwtzyWFbDezuyH6vI
 V94i3UALIcHUq+1k9X6113KCoGNL/WGH7Sh7HyIRO5gW4MUcRDWWF9rtn6ZSWCbxYo7y
 Fw7Q==
X-Gm-Message-State: AOAM530hg1ExwEvSaCTNRCWtAp/GHD28G13Gw6+XjtRU+BQGXk36IH83
 1GMPnNhJvPl9MAwu4qF5WXa32r6yJUfrRirKLR3Au6kYvhFV9cXs+0Gl0g9yvUqmOlu54Dy56kG
 924dusuibGz5DANAC18m9RfSQXn9fKjWRClnLjg==
X-Received: by 2002:a05:6000:178c:b0:203:86a7:e49 with SMTP id
 e12-20020a056000178c00b0020386a70e49mr3179116wrg.640.1647508136321; 
 Thu, 17 Mar 2022 02:08:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrJ2enNRjNFJ5gVFBBS+CMYk0beLWJ72G+IrbS7cK85VdZH4bLMtvd5fSgE/nGNcDAySl0c8swJ7oR+9naZCo=
X-Received: by 2002:a05:6000:178c:b0:203:86a7:e49 with SMTP id
 e12-20020a056000178c00b0020386a70e49mr3179097wrg.640.1647508136104; Thu, 17
 Mar 2022 02:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <202203170954.vFlMcTje-lkp@intel.com>
In-Reply-To: <202203170954.vFlMcTje-lkp@intel.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 17 Mar 2022 10:08:44 +0100
Message-ID: <CAHc6FU6O-8sjt5vpLDUk29Ogm5Y3rDxqZJfQNDC-pOEOH9oHeA@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Cluster-devel] [kbuild] [gfs2:for-next 9/11]
 fs/gfs2/file.c:796:24: sparse: unsigned int *
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel <cluster-devel@redhat.com>, kbuild@lists.01.org,
 kbuild-all@lists.01.org, lkp@intel.com, LKML <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 9:25 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git  for-next
> head:   a20050c14edf19add5a9588cb196bb00aa410650
> commit: 165d142ffacdef3e620819a1031df3d896aa29ab [9/11] gfs2: Fix should_fault_in_pages() logic
> config: sh-randconfig-s032-20220313 (https://download.01.org/0day-ci/archive/20220317/202203170954.vFlMcTje-lkp@intel.com/config )
> compiler: sh4-linux-gcc (GCC) 11.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross  -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=165d142ffacdef3e620819a1031df3d896aa29ab
>         git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
>         git fetch --no-tags gfs2 for-next
>         git checkout 165d142ffacdef3e620819a1031df3d896aa29ab
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh SHELL=/bin/bash fs/gfs2/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> sparse warnings: (new ones prefixed by >>)
>    fs/gfs2/file.c:796:24: sparse: sparse: incompatible types in comparison expression (different signedness):
> >> fs/gfs2/file.c:796:24: sparse:    unsigned int *
>    fs/gfs2/file.c:796:24: sparse:    int *
> >> fs/gfs2/file.c:796:24: sparse: sparse: cannot size expression
>
> vim +796 fs/gfs2/file.c
>
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  773  static inline bool should_fault_in_pages(ssize_t ret, struct iov_iter *i,
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  774                                    size_t *prev_count,
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  775                                    size_t *window_size)
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  776  {
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  777   size_t count = iov_iter_count(i);
> 165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  778   size_t size, offs;
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  779
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  780   if (likely(!count))
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  781           return false;
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  782   if (ret <= 0 && ret != -EFAULT)
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  783           return false;
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  784   if (!iter_is_iovec(i))
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  785           return false;
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  786
> 165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  787   size = PAGE_SIZE;
> 165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  788   offs = offset_in_page(i->iov[0].iov_base + i->iov_offset);
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  789   if (*prev_count != count || !*window_size) {
> 165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  790           int nr_dirtied;
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  791
> 165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  792           size = ALIGN(offs + count, PAGE_SIZE);
> 165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  793           size = min_t(size_t, size, SZ_1M);
> 00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  794           nr_dirtied = max(current->nr_dirtied_pause -
> 165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  795                            current->nr_dirtied, 8);
> 165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07 @796           size = min(size, nr_dirtied << PAGE_SHIFT);
>
> size is size_t so nr_dirtied needs to be size_t as well.  I'm surprised
> this compiles.  The min()/max() macros are supposed to trigger a compile
> error for type mismatches.

Already fixed, thanks.

Andreas

