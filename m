Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767470DDCB
	for <lists+cluster-devel@lfdr.de>; Tue, 23 May 2023 15:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684849467;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xe6yJPZ6RPA0ddH1QOG2qkfGCUr/gLKEvN1ZtXb/JI8=;
	b=hAtXInIOx9uIDFq0rAN+vbxX15pbjaYslVibWxhozj4tQ1DANJMrQuMgkgbJqTf9QTthe+
	aUxtVgZspuIjxX4geCvw3pGv7PooljKkHMLIQkBoK8QPJuCZ5+gFEV3zJPG04SH6qMENuk
	14Fb9tJ5MD2PeAVugND+KKFQAxqKc5Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-ezSsB27bMTKfWlTyXR86UQ-1; Tue, 23 May 2023 09:44:23 -0400
X-MC-Unique: ezSsB27bMTKfWlTyXR86UQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5A031C00D29;
	Tue, 23 May 2023 13:44:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B369D20296C6;
	Tue, 23 May 2023 13:44:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 70DFD19465B6;
	Tue, 23 May 2023 13:44:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DF2D119465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 May 2023 13:44:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CF5507AE4; Tue, 23 May 2023 13:44:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C811D9D7A
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 13:44:07 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20D1A101A53A
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 13:44:07 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-OYr0MRU5PY-5fD15IwpHFQ-1; Tue,
 23 May 2023 09:44:05 -0400
X-MC-Unique: OYr0MRU5PY-5fD15IwpHFQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6248D222CC;
 Tue, 23 May 2023 13:34:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35F8B13A10;
 Tue, 23 May 2023 13:34:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mYAoDevAbGTfSQAAMHmgww
 (envelope-from <jack@suse.cz>); Tue, 23 May 2023 13:34:35 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 98FC1A075D; Tue, 23 May 2023 15:34:31 +0200 (CEST)
Date: Tue, 23 May 2023 15:34:31 +0200
From: Jan Kara <jack@suse.cz>
To: Kent Overstreet <kent.overstreet@linux.dev>
Message-ID: <20230523133431.wwrkjtptu6vqqh5e@quack3>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
MIME-Version: 1.0
In-Reply-To: <ZFs3RYgdCeKjxYCw@moria.home.lan>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 06/32] sched: Add
 task_struct->faults_disabled_mapping
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
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
 "Darrick J . Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-bcachefs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 10-05-23 02:18:45, Kent Overstreet wrote:
> On Wed, May 10, 2023 at 03:07:37AM +0200, Jan Kara wrote:
> > On Tue 09-05-23 12:56:31, Kent Overstreet wrote:
> > > From: Kent Overstreet <kent.overstreet@gmail.com>
> > > 
> > > This is used by bcachefs to fix a page cache coherency issue with
> > > O_DIRECT writes.
> > > 
> > > Also relevant: mapping->invalidate_lock, see below.
> > > 
> > > O_DIRECT writes (and other filesystem operations that modify file data
> > > while bypassing the page cache) need to shoot down ranges of the page
> > > cache - and additionally, need locking to prevent those pages from
> > > pulled back in.
> > > 
> > > But O_DIRECT writes invoke the page fault handler (via get_user_pages),
> > > and the page fault handler will need to take that same lock - this is a
> > > classic recursive deadlock if userspace has mmaped the file they're DIO
> > > writing to and uses those pages for the buffer to write from, and it's a
> > > lock ordering deadlock in general.
> > > 
> > > Thus we need a way to signal from the dio code to the page fault handler
> > > when we already are holding the pagecache add lock on an address space -
> > > this patch just adds a member to task_struct for this purpose. For now
> > > only bcachefs is implementing this locking, though it may be moved out
> > > of bcachefs and made available to other filesystems in the future.
> > 
> > It would be nice to have at least a link to the code that's actually using
> > the field you are adding.
> 
> Bit of a trick to link to a _later_ patch in the series from a commit
> message, but...
> 
> https://evilpiepirate.org/git/bcachefs.git/tree/fs/bcachefs/fs-io.c#n975
> https://evilpiepirate.org/git/bcachefs.git/tree/fs/bcachefs/fs-io.c#n2454

Thanks and I'm sorry for the delay.

> > Also I think we were already through this discussion [1] and we ended up
> > agreeing that your scheme actually solves only the AA deadlock but a
> > malicious userspace can easily create AB BA deadlock by running direct IO
> > to file A using mapped file B as a buffer *and* direct IO to file B using
> > mapped file A as a buffer.
> 
> No, that's definitely handled (and you can see it in the code I linked),
> and I wrote a torture test for fstests as well.

I've checked the code and AFAICT it is all indeed handled. BTW, I've now
remembered that GFS2 has dealt with the same deadlocks - b01b2d72da25
("gfs2: Fix mmap + page fault deadlocks for direct I/O") - in a different
way (by prefaulting pages from the iter before grabbing the problematic
lock and then disabling page faults for the iomap_dio_rw() call). I guess
we should somehow unify these schemes so that we don't have two mechanisms
for avoiding exactly the same deadlock. Adding GFS2 guys to CC.

Also good that you've written a fstest for this, that is definitely a useful
addition, although I suspect GFS2 guys added a test for this not so long
ago when testing their stuff. Maybe they have a pointer handy?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

