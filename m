Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1BC71084A
	for <lists+cluster-devel@lfdr.de>; Thu, 25 May 2023 11:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685005637;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KuhUxhJ4qXqlC8S61jGgkZ/rePw29whTgtvzHY6sSiI=;
	b=JbHqoBnQPQQ5pXJpPHKO3Pdl+FozOKUXjf9MLEfiLIyfwfRvKkuFObZ6gQqXrfjNN+jAYr
	8XCr2jt64trAeboy+RHqR2en6Bp/y57pt8U5iqjH8n5e80cRe9H5g2MSwbHGJz0+Okj9LZ
	AugTXmsAziVo1LtHmRVkY60PVjKO5EY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-mfONxyOCPBa_k5-Psc4YYg-1; Thu, 25 May 2023 05:07:11 -0400
X-MC-Unique: mfONxyOCPBa_k5-Psc4YYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66F78101A53A;
	Thu, 25 May 2023 09:07:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AC212029F6E;
	Thu, 25 May 2023 09:07:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 78CC01946A42;
	Thu, 25 May 2023 09:07:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC4DB19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 May 2023 08:47:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BAF06492B0B; Thu, 25 May 2023 08:47:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3E12492B0A
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 08:47:35 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DDE11C07554
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 08:47:35 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-91-uwe-WIE0MnisGG7WWt3IhQ-1; Thu,
 25 May 2023 04:47:33 -0400
X-MC-Unique: uwe-WIE0MnisGG7WWt3IhQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C360B21CA3;
 Thu, 25 May 2023 08:47:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1FAA13356;
 Thu, 25 May 2023 08:47:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mxRrK6Mgb2TyRAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 25 May 2023 08:47:31 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 36009A075C; Thu, 25 May 2023 10:47:31 +0200 (CEST)
Date: Thu, 25 May 2023 10:47:31 +0200
From: Jan Kara <jack@suse.cz>
To: Kent Overstreet <kent.overstreet@linux.dev>
Message-ID: <20230525084731.losrlnarpbqtqzil@quack3>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzugpw7vgCFxOYL@moria.home.lan>
MIME-Version: 1.0
In-Reply-To: <ZGzugpw7vgCFxOYL@moria.home.lan>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

On Tue 23-05-23 12:49:06, Kent Overstreet wrote:
> > > No, that's definitely handled (and you can see it in the code I linked),
> > > and I wrote a torture test for fstests as well.
> > 
> > I've checked the code and AFAICT it is all indeed handled. BTW, I've now
> > remembered that GFS2 has dealt with the same deadlocks - b01b2d72da25
> > ("gfs2: Fix mmap + page fault deadlocks for direct I/O") - in a different
> > way (by prefaulting pages from the iter before grabbing the problematic
> > lock and then disabling page faults for the iomap_dio_rw() call). I guess
> > we should somehow unify these schemes so that we don't have two mechanisms
> > for avoiding exactly the same deadlock. Adding GFS2 guys to CC.
> 
> Oof, that sounds a bit sketchy. What happens if the dio call passes in
> an address from the same address space?

If we submit direct IO that uses mapped file F at offset O as a buffer for
direct IO from file F, offset O, it will currently livelock in an
indefinite retry loop. It should rather return error or fall back to
buffered IO. But that should be fixable. Andreas?

But if the buffer and direct IO range does not overlap, it will just
happily work - iomap_dio_rw() invalidates only the range direct IO is done
to.

> What happens if we race with the pages we faulted in being evicted?

We fault them in again and retry.

> > Also good that you've written a fstest for this, that is definitely a useful
> > addition, although I suspect GFS2 guys added a test for this not so long
> > ago when testing their stuff. Maybe they have a pointer handy?
> 
> More tests more good.
> 
> So if we want to lift this scheme to the VFS layer, we'd start by
> replacing the lock you added (grepping for it, the name escapes me) with
> a different type of lock - two_state_shared_lock in my code, it's like a
> rw lock except writers don't exclude other writers. That way the DIO
> path can use it without singlethreading writes to a single file.

Yes, I've noticed that you are introducing in bcachefs a lock with very
similar semantics to mapping->invalidate_lock, just with this special lock
type. What I'm kind of worried about with two_state_shared_lock as
implemented in bcachefs is the fairness. AFAICS so far if someone is e.g.
heavily faulting pages on a file, direct IO to that file can be starved
indefinitely. That is IMHO not a good thing and I would not like to use
this type of lock in VFS until this problem is resolved. But it should be
fixable e.g. by introducing some kind of deadline for a waiter after which
it will block acquisitions of the other lock state.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

