Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0408F3987CC
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Jun 2021 13:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622632622;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=n6ruBB0Ytz1nu7rTAZGTMPhHF3U9i3+0Qv8sww0BF7w=;
	b=gudFzaD8XRHCe8Xusr6tcRPqmKbYkxGg0CKEvamBRUHS3/ul0mFOUNfS3aFhYx3LPInPRw
	/CxbzkKcAdHO8SwETdT63BwvrWTzg9S/chh2lnH8Y0z3OMcDKlKCf1bMbMwEVuIiJVSqE+
	ZyggUXvzu/q9Vc/JgOd1w/ZKUyEIOUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-5YqDpazYMFiw-UGwH6pOPQ-1; Wed, 02 Jun 2021 07:17:00 -0400
X-MC-Unique: 5YqDpazYMFiw-UGwH6pOPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 395A5100945E;
	Wed,  2 Jun 2021 11:16:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7A21102AE7E;
	Wed,  2 Jun 2021 11:16:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 466891801264;
	Wed,  2 Jun 2021 11:16:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 152BGmIe009168 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 07:16:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D06CD101B744; Wed,  2 Jun 2021 11:16:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA55E10F8E3B
	for <cluster-devel@redhat.com>; Wed,  2 Jun 2021 11:16:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBD8080D0E3
	for <cluster-devel@redhat.com>; Wed,  2 Jun 2021 11:16:45 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-182-WQzIwGAGNE-XIfTFOCrj1Q-1; Wed, 02 Jun 2021 07:16:44 -0400
X-MC-Unique: WQzIwGAGNE-XIfTFOCrj1Q-1
Received: by mail-wr1-f72.google.com with SMTP id
	q15-20020adfc50f0000b0290111f48b865cso871671wrf.4
	for <cluster-devel@redhat.com>; Wed, 02 Jun 2021 04:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n6ruBB0Ytz1nu7rTAZGTMPhHF3U9i3+0Qv8sww0BF7w=;
	b=l3YLKdKTz+im4LV/BxO/CiaY2ZfB0zMGqUm5IhOyiGtytZYL8P6Tdm7txNNOAAFoUw
	E42/0jknhHNuBmPVfhUH25GiRHRJaS//ASPlidBgM+QGZdkNX/NqZweguM9RMtMQ0jPf
	4/ZuaMVTRmxUHDqFS2shpN1rda69n1s4fp7Wu7KUU8ptuGL/+hIBQPTwvIZj56SZop1I
	Cnl3IxJqnlRWfBIgwDu1uoHXdV/jQnLzKvR3OUnWktCp8skD4vZZiExnSQXTABvXELEN
	Pr4bby9+QtHcfelVzXlehHK0SZZQKVRkWIObU0aYUQq95uOdh+D/Ie8e7w1u+z9UdkGL
	4C2w==
X-Gm-Message-State: AOAM533qvqlCtXje1PfdYBZx72SQZntnhuJnRj8nHslKb2XYp/WBF25k
	DxmDbiEawGwnIVrgsuvdFUXcC37QfOywzHvz+Pub+b2eLg05ysDHdxx+ETQliL9InC8XS7esG/q
	sSn24rWz39vu857+awTaIdSMXpUAO24lod8mF5A==
X-Received: by 2002:adf:eac9:: with SMTP id o9mr17338207wrn.78.1622632603306; 
	Wed, 02 Jun 2021 04:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvQfVLspuqWRiLVnfyZcyInXdEvPRHne1Wa0GUdhPjf6KYnH2vnLr99kOz5alPu9eAz6IUiT2mUWvuN+eIjQA=
X-Received: by 2002:adf:eac9:: with SMTP id o9mr17338194wrn.78.1622632603144; 
	Wed, 02 Jun 2021 04:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210531170123.243771-1-agruenba@redhat.com>
	<20210531170123.243771-5-agruenba@redhat.com>
	<CAHk-=wiB9gvUsebmiOaRXzYVUxJDUt1SozGtRyxR_MDR=Nv7YQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiB9gvUsebmiOaRXzYVUxJDUt1SozGtRyxR_MDR=Nv7YQ@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 2 Jun 2021 13:16:32 +0200
Message-ID: <CAHc6FU4n_F9sPjP7getGRKLpB-KsZt_qhHctqwY5pJrxGxLr2w@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [RFC 4/9] gfs2: Fix mmap + page fault deadlocks
	(part 1)
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 1, 2021 at 8:00 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Mon, May 31, 2021 at 7:01 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > Fix that by recognizing the self-recursion case.
>
> Hmm. I get the feeling that the self-recursion case should never have
> been allowed to happen in the first place.
>
> IOW, is there some reason why you can't make the user accesses always
> be done with page faults disabled (ie using the "atomic" user space
> access model), and then if you get a partial read (or write) to user
> space, at that point you drop the locks in read/write, do the "try to
> make readable/writable" and try again.
>
> IOW, none of this "detect recursion" thing. Just "no recursion in the
> first place".
>
> That way you'd not have these odd rules at fault time at all, because
> a fault while holding a lock would never get to the filesystem at all,
> it would be aborted early. And you'd not have any odd "inner/outer"
> locks, or lock compatibility rules or anything like that. You'd
> literally have just "oh, I didn't get everything at RW time while I
> held locks, so let's drop the locks, try to access user space, and
> retry".

Well, iomap_file_buffered_write() does that by using
iov_iter_fault_in_readable() and iov_iter_copy_from_user_atomic() as
in iomap_write_actor(), but the read and direct I/O side doesn't seem
to have equivalents. I suspect we can't just wrap
generic_file_read_iter() and iomap_dio_rw() calls in
pagefault_disable().

> Wouldn't that be a lot simpler and more robust?

Sure, with vfs primitives that support atomic user-space access and
with a iov_iter_fault_in_writeable() like operation, we could do that.

> Because what if the mmap is something a bit more complex, like
> overlayfs or userfaultfd, and completing the fault isn't about gfs2
> handling it as a "fault", but about some *other* entity calling back
> to gfs2 and doing a read/write instead? Now all your "inner/outer"
> lock logic ends up being entirely pointless, as far as I can tell, and
> you end up deadlocking on the lock you are holding over the user space
> access _anyway_.

Yes, those kinds of deadlocks would still be possible.

Until we have a better solution, wouldn't it make sense to at least
prevent those self-recursion deadlocks? I'll send a separate pull
request in case you find that acceptable.

Thanks,
Andreas

