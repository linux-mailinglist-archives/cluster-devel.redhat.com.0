Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD9A3D8A1A
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jul 2021 10:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627462638;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JqKiltd1afSxcGtcwLKV2ppcp3Yq161Vo8rnyFtpN1w=;
	b=EWUbPjOBILoe0SOpUjwrW7reNpORj27793gMwCJGMFjQTrThlFGycEL44DmlDJhlIH14Zz
	iWASZykI4K5nOgQWboFo1G62jfR3nkrJkm32HeA/G5DH/181AUhUXetodrCz9JwjZjeeF3
	JQ/dqMruYC73aSGO2ZPDcI7gWcUcQ40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-JizsKIEEO1-0avmKMnQqoA-1; Wed, 28 Jul 2021 04:57:17 -0400
X-MC-Unique: JizsKIEEO1-0avmKMnQqoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAC8F107465F;
	Wed, 28 Jul 2021 08:57:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4BA3179B3;
	Wed, 28 Jul 2021 08:57:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B26D180BAB0;
	Wed, 28 Jul 2021 08:57:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16S8vAnF020129 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 04:57:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 75BF5200E56C; Wed, 28 Jul 2021 08:57:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71AEE200E56B
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 08:57:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD14896B07E
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 08:57:05 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-397-7aDTf8aVPAa3Wr2MVLS-Tg-1; Wed, 28 Jul 2021 04:57:04 -0400
X-MC-Unique: 7aDTf8aVPAa3Wr2MVLS-Tg-1
Received: by mail-wm1-f72.google.com with SMTP id
	c2-20020a7bc8420000b0290238db573ab7so1247971wml.5
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 01:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=JqKiltd1afSxcGtcwLKV2ppcp3Yq161Vo8rnyFtpN1w=;
	b=gbzKQ4A2rO+cGEIvcxr0YWDqVn8yQhLVHpNcwNYFodnq7lblqDh2oQqlIvoEYum7CA
	LnxXgPgyVsimXZUlJgpTNGEky44NjoZSTwC/OhpEeP77IFlhUhuMbkLLM17vWXLnAPmA
	EUiKfcmQHsE8nqWI7Z5fSHEPIzpLu9bWaJCk3HQkJvMafGcevUqIYbp+wJSPZ1EhPjKk
	wRpo21rkqVvnJBn0OXuQsWdoBTk+ZbuHby9H0r4KXT2w9203JTmVC0dOqNIYv2yysCZV
	HgS1GC5idTwx4sO1ccUf8+AxRz54Hl6dhwyHEhhsY/uEMwTLP6O3k+St688PkiP0T8lu
	+6wQ==
X-Gm-Message-State: AOAM532WaiWlkL2DC3utUEq7w4YYXn5s2WlmPiNlAsRCAZgtNEWgG1I1
	E3bTQA/TDXT9Ai3z9JkoVRcJAhpbYWoqElWwxqoTWBa51UJk6u7s5zaoySLYv6YD7RV9yU9LGnr
	fZdFc/LPC2a56cWnlVGU6EA==
X-Received: by 2002:a05:6000:2aa:: with SMTP id
	l10mr25675922wry.116.1627462623122; 
	Wed, 28 Jul 2021 01:57:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNt+yAZN5l77ezyMw7Cekn5SMHH4MrO8NwS44ruwRIatuQLUMx59EY8AdIQipsLqj6zPYO0Q==
X-Received: by 2002:a05:6000:2aa:: with SMTP id
	l10mr25675910wry.116.1627462622992; 
	Wed, 28 Jul 2021 01:57:02 -0700 (PDT)
Received: from
	0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
	(0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
	[2001:8b0:ffda:0:2059:8730:b2:c370])
	by smtp.gmail.com with ESMTPSA id
	t17sm2753521wru.94.2021.07.28.01.57.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Jul 2021 01:57:02 -0700 (PDT)
Message-ID: <d2f338843211059e4f35996c4771fdbfa80aab65.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>, Bob Peterson
	<rpeterso@redhat.com>, Jan Kara <jack@suse.cz>, Matthew Wilcox
	<willy@infradead.org>
Date: Wed, 28 Jul 2021 09:57:01 +0100
In-Reply-To: <CAHc6FU6NNG3M8ewuehy50G4PVJ7v_aWgoUpZfNitJSzU1ajzdA@mail.gmail.com>
References: <20210713180958.66995-1-rpeterso@redhat.com>
	<20210713180958.66995-11-rpeterso@redhat.com>
	<34e7b795c97d781b8788d965dd7caf48d8b8ec24.camel@redhat.com>
	<76779e30-76b3-b867-7d1c-46a96b56a741@redhat.com>
	<CAHc6FU6NNG3M8ewuehy50G4PVJ7v_aWgoUpZfNitJSzU1ajzdA@mail.gmail.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 10/10] gfs2: replace sd_aspace with
 sd_inode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 2021-07-28 at 08:50 +0200, Andreas Gruenbacher wrote:
> On Tue, Jul 13, 2021 at 9:34 PM Bob Peterson <rpeterso@redhat.com>
> wrote:
> > On 7/13/21 1:26 PM, Steven Whitehouse wrote:
> > 
> > Hi,
> > 
> > On Tue, 2021-07-13 at 13:09 -0500, Bob Peterson wrote:
> > 
> > Before this patch, gfs2 kept its own address space for rgrps, but
> > this
> > caused a lockdep problem because vfs assumes a 1:1 relationship
> > between
> > address spaces and their inode. One problematic area is this:
> > 
> > I don't think that is the case. The reason that the address space
> > is a
> > separate structure in the first place is to allow them to exist
> > without
> > an inode. Maybe that has changed, but we should see why that is, in
> > that case rather than just making this change immediately.
> > 
> > I can't see any reason why if we have to have an inode here that it
> > needs to be hashed... what would need to look it up via the hashes?
> > 
> > Steve.
> > 
> > Hi,
> > 
> > The actual use case, which is easily demonstrated with lockdep, is
> > given
> > in the patch text shortly after where you placed your comment. This
> > goes
> > back to this discussion from April 2018:
> > 
> > https://listman.redhat.com/archives/cluster-devel/2018-April/msg00017.html
> > 
> > in which Jan Kara pointed out that:
> > 
> > "The problem is we really do expect mapping->host->i_mapping ==
> > mapping as
> > we pass mapping and inode interchangeably in the mm code. The
> > address_space
> > and inodes are separate structures because you can have many inodes
> > pointing to one address space (block devices). However it is not
> > allowed
> > for several address_spaces to point to one inode!"
> 
> This is fundamentally at adds with how we manage inodes: we have
> inode->i_mapping which is the logical address space of the inode, and
> we have gfs2_glock2aspace(GFS2_I(inode)->i_gl) which is the metadata
> address space of the inode. The most important function of the
> metadata address space is to remove the inode's metadata from memory
> by truncating the metadata address space (inode_go_inval). We need
> that when moving an inode to another node. I don't have the faintest
> idea how we could otherwise achieve that in a somewhat efficient way.
> 
> Thanks,
> Andreas
> 

In addition, I'm fairly sure also that we were told to use this
solution (i.e. a separate address space) back in the day because it was
expected that they didn't have a 1:1 relationship with inodes. I don't
think we'd have used that solution otherwise. I've not had enough time
to go digging back in my email to check, but it might be worth looking
to see when we introduced the use of the second address space (removing
a whole additional inode structure) and any discussions around that
change,

Steve.



