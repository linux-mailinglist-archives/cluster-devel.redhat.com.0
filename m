Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BDB4B508D
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Feb 2022 13:48:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644842913;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MC+a4E5vHWoqeNe7xNwus8zL3QSv56UCI6HKMK1dOuA=;
	b=f9nlZbBlPT4LzQcB06buJy4/JGEQrarUWCZ7EI7yguSQUffpP1VQw9JFf0PQD9yQu1P7MG
	GnVowYicwomJ2HwyjTofjX4KEU7PbySd9jwJdemIzW2X6Yzy7N7tJ/Nr38BsaqFHe8ucAk
	rGoDvVWPk7n2zP061MmjMnF9mCbda0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-ORoBMYSFPfGp4UdL9IkI8w-1; Mon, 14 Feb 2022 07:48:30 -0500
X-MC-Unique: ORoBMYSFPfGp4UdL9IkI8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB8B0802924;
	Mon, 14 Feb 2022 12:48:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 060286FB02;
	Mon, 14 Feb 2022 12:48:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 977554BB7C;
	Mon, 14 Feb 2022 12:48:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21ECmHf2005175 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Feb 2022 07:48:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 318B153C6; Mon, 14 Feb 2022 12:48:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B1E27AD3
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 12:48:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB91C1066684
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 12:48:10 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
	[209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-561-bTxEDABuNJKnZvf2hSrZ5g-1; Mon, 14 Feb 2022 07:48:09 -0500
X-MC-Unique: bTxEDABuNJKnZvf2hSrZ5g-1
Received: by mail-qv1-f72.google.com with SMTP id
	kl13-20020a056214518d00b0042cb237f86bso4248702qvb.0
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 04:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MC+a4E5vHWoqeNe7xNwus8zL3QSv56UCI6HKMK1dOuA=;
	b=zq9SAjUzM+iAao6Pxy39RC8DmxD9IIaglSODFqWmISNXYQwwZN3z39US356ntFUyMh
	cwVgcZp6B1hENVwMJe4m/34QJqQY5hmwFWtPqG6OsylShbyCUhi7ZbbDlP4D6ZQ9hnlX
	O5TYUq1N2QtOqL/GoFo4F2Cn1coixGJVdna4OdNJXm4w5gil83tsKmD9eMYNzC8+hNNH
	Og2i/TwjSTGlRzmAWg+sQL+r51gIp5Y+NEiZIjnacRKgeO+UbNIhCOCSp/moXwYVE3R0
	ZVEsT1fYDTfO6l6jhGHUlohRiPBwI4640oP/sk4ZAtf9Qgwfja2rcGEmYbxhyFvjBKzK
	cs/A==
X-Gm-Message-State: AOAM530CvTlm76g1feSWK8aGyQ5PfXhHFEF4nzA5djJrfa/iIeqt3piW
	53hfy1TC1PhJHIEZmm+E11r7l2CxqZV/cryqbswyno3yYG/DbIt+JpgQo4tHQ0JiEkNN92u1pj1
	2ncSk6pUkKwrsJMAVYRVCRwb13tilUyiGU/ps4w==
X-Received: by 2002:a05:622a:10f:: with SMTP id
	u15mr8988270qtw.339.1644842887923; 
	Mon, 14 Feb 2022 04:48:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSAqPv73z8awPafmB3AtaUBWoo4/Bu3VNSyyIEKMSC9kDJgTFGhqlwjU0TEHUMNzFZCtOc+1wT0BFM71n+MNs=
X-Received: by 2002:a05:622a:10f:: with SMTP id
	u15mr8988260qtw.339.1644842887712; 
	Mon, 14 Feb 2022 04:48:07 -0800 (PST)
MIME-Version: 1.0
References: <202201221028.YKA8kSdm-lkp@intel.com>
	<CAK-6q+h_hb94J3DSXPk=E44kCxiwZ+BE3kMJe09iShRzMb=vzQ@mail.gmail.com>
	<Ygnk6niBpaxF8rwr@zeniv-ca.linux.org.uk>
In-Reply-To: <Ygnk6niBpaxF8rwr@zeniv-ca.linux.org.uk>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 14 Feb 2022 07:47:56 -0500
Message-ID: <CAK-6q+jX6Aa79Ci3E7_+WxXCAh2BF5s67yVNRQze0-25iKjDOA@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, kbuild-all@lists.01.org,
	kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Feb 14, 2022 at 12:33 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Sat, Jan 22, 2022 at 01:28:20PM -0500, Alexander Aring wrote:
> > Hi,
> >
> > On Fri, Jan 21, 2022 at 9:45 PM kernel test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   9b57f458985742bd1c585f4c7f36d04634ce1143
> > > commit: 658bd576f95ed597e519cdadf1c86ac87c17aea5 fs: dlm: move version conversion to compile time
> > > date:   3 months ago
> > > config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20220122/202201221028.YKA8kSdm-lkp@intel.com/config)
> > > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > > reproduce:
> > >         # apt-get install sparse
> > >         # sparse version: v0.6.4-dirty
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=658bd576f95ed597e519cdadf1c86ac87c17aea5
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout 658bd576f95ed597e519cdadf1c86ac87c17aea5
> > >         # save the config file to linux build tree
> > >         mkdir build_dir
> > >         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> >
> > I have it on my list but it isn't easy to make sparse happy here...
> > this is the second time the robot reported this issue. Is there a way
> > to turn the robot off in that case?
> >
> > Maybe some human who reads that knows the answer?
>
> Frankly, these "convert in place" functions (dlm_message_in(), etc.) are
> asking for trouble.  IOW, it's a genuinely fishy code.
>
> Saner approach is to keep them in little-endian through the entire thing,
> but it's quite a bit of massage.

Yes, I agree. That is also what "/net" does, "mark it stored" the way
as the wire handles it.

- Alex

