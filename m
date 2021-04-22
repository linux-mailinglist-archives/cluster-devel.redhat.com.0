Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A7BA536846F
	for <lists+cluster-devel@lfdr.de>; Thu, 22 Apr 2021 18:11:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-0r1-gzCfNDOH_fwFgQWLvA-1; Thu, 22 Apr 2021 12:11:16 -0400
X-MC-Unique: 0r1-gzCfNDOH_fwFgQWLvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFF938189C7;
	Thu, 22 Apr 2021 16:11:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A01562BFE7;
	Thu, 22 Apr 2021 16:11:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66FAE1809C82;
	Thu, 22 Apr 2021 16:11:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13MGBAX6008249 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 22 Apr 2021 12:11:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D7E5217938D; Thu, 22 Apr 2021 16:11:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7823A2179386
	for <cluster-devel@redhat.com>; Thu, 22 Apr 2021 16:11:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA62B802A64
	for <cluster-devel@redhat.com>; Thu, 22 Apr 2021 16:11:07 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-13-MMKQ8nuWOj2ehWKuG_mX9Q-1;
	Thu, 22 Apr 2021 12:11:05 -0400
X-MC-Unique: MMKQ8nuWOj2ehWKuG_mX9Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 67507B061;
	Thu, 22 Apr 2021 16:11:03 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 353A31E37A2; Thu, 22 Apr 2021 18:11:03 +0200 (CEST)
Date: Thu, 22 Apr 2021 18:11:03 +0200
From: Jan Kara <jack@suse.cz>
To: Bob Peterson <rpeterso@redhat.com>
Message-ID: <20210422161103.GA8755@quack2.suse.cz>
References: <20210422112612.GF26221@quack2.suse.cz>
	<CAHc6FU7kFWtQDAAU16h3xkWkSV2dm9WWb-RbjXBusJ9+118GRw@mail.gmail.com>
	<20210422131419.GI26221@quack2.suse.cz>
	<619588401.12709186.1619107034528.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
In-Reply-To: <619588401.12709186.1619107034528.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>
Subject: Re: [Cluster-devel] Hole punch races in GFS2
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 22-04-21 11:57:14, Bob Peterson wrote:
> ----- Original Message -----
> > OK, thanks for explanation! I missed that GFS2 glocks are task local. But
> > then I have another question. We have the following:
> > 
> > gfs2_file_read_iter()
> >   grabs inode glock in shared mode
> >   generic_file_read_iter()
> >     filemap_read()
> >       copy_page_to_iter()
> >         <page fault>
> >         grabs mmap_sem
> >           gfs2_fault()
> >             - tries to grab inode glock again -> possible recursive locking
> > 
> > And even if the locking isn't recursive, you have glock->mmap_sem and
> > mmap_sem->glock lock orderings so ABBA deadlocks are possible AFAICT.
> > 
> > And there's a similar problem with the write path as well, just the lock is
> > grabbed exclusively.
> > 
> > 								Honza
> > --
> > Jan Kara <jack@suse.com>
> > SUSE Labs, CR
> 
> Hi Jan,
> 
> IIRC, gfs2 tries to prevent the page fault by having gfs2_file_read_iter
> call into generic_file_read_iter twice:
> 
> The first time without the glock held, but specifying IOCB_NOIO, which
> brings the pages in and returns -EAGAIN. Then it acquires the glock,
> then calls into generic_file_read_iter a second time.
> 
> I'm not sure if that prevents the deadlock or just makes it less likely.
> I still need to investigate that.

Aha, I missed that trick. Thanks for pointing that out. But indeed this
just makes the race harder to hit. If already the first page is not in the
page cache and needs to be fetched from the disk, nothing is faulted in and
you have to do everything in the call with glock held. And even if you
prefaulted the whole buffer, there's no guarantee it doesn't get reclaimed
again before you reach copy_page_to_iter().

Also the write path doesn't seem to play any tricks like this and is prone
to the same kind of problem:

iomap_file_buffered_write()
  iomap_apply()
    gfs2_iomap_begin() - takes glock
    iomap_write_actor()
      iov_iter_fault_in_readable()
        <fault>

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

