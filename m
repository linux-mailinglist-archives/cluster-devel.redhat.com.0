Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9A50D10929A
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Nov 2019 18:06:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574701580;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G2kRKe1607pYBNeGCdSPQghr+0XlzZPnvCs3u67LGLg=;
	b=ItgmSGqDskXVUqAfWbqonJ46pS8GvA4uvCPQmYZ82oei4j1yPLTuF5pUrDDahauUuQ/g+K
	ZGSR5AOhH5aJDDZIRl7ANoWBun5ATAUOidPHU2gVbvqQ/qLSLc0gGKZxDq9DDRLynGXoEf
	Wr3ZVdINFLiKw2pBX8sFU9mnhA8/40E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-LE_WskRoPmysrgrKQd3XNg-1; Mon, 25 Nov 2019 12:06:18 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBCD4477;
	Mon, 25 Nov 2019 17:06:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 614CF60C84;
	Mon, 25 Nov 2019 17:06:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 983644BB65;
	Mon, 25 Nov 2019 17:06:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAPH5tnW026373 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 25 Nov 2019 12:05:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C8F42166B27; Mon, 25 Nov 2019 17:05:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 283DE2166B28
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 17:05:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50B84905B6F
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 17:05:53 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-282--KaQP4o2MjqAwtAoI7v3Lg-1; Mon, 25 Nov 2019 12:05:51 -0500
Received: by mail-lj1-f193.google.com with SMTP id y23so16736899ljh.10
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 09:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IP1wfK3f8gL3K5of14NSdEE7VLJRLmDh9Mjfd6jLIUg=;
	b=RLQzgDoU4G29m7ewclSWE5jkg5fBSil8UwbwQmxCV8FIFWEDt8cBR50besUs75+VKe
	0bNt9z9CkJiO5ueANDCsdzUqN67wavbnuC2cP3leIK7XRF1mhrEfMg5et7AyW6sprbge
	73oA9PuZE/gd3qlLLKLmgaDQswF8j50llIsZfy42DChAgZgW/dWOcAFHjhgwy2xtmSDj
	GVyIjyGroJBI/T4aiJVbzVL7Gg89bTTmDPKPPa/gx0ryEPhM8eE1A02sCM1C7nid9pa2
	o87bQVKzhYmfnfEFbh8+J0wyYqboxS14wS9u6gIk/BsWS9CUFd8AjwNI1fh8nJsfWr6O
	/9Fg==
X-Gm-Message-State: APjAAAXUGbcYrgV46pI4L5rXvNG11IOtoA/p+zHdjGxxDzD9yGmewzTl
	iygH5DC5L2/bd1UJWV0Qdbv7Rj4dhgk=
X-Google-Smtp-Source: APXvYqxhTb1uS8CnyHPLiTtKBbQMj+lfaHTd6QDPp1KA/5ji3j/OvXdjmSq02pEswasRiK7ZCfFjag==
X-Received: by 2002:a2e:8e27:: with SMTP id r7mr23733152ljk.101.1574701549430; 
	Mon, 25 Nov 2019 09:05:49 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
	[209.85.167.51])
	by smtp.gmail.com with ESMTPSA id 12sm4316803lju.55.2019.11.25.09.05.45
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 25 Nov 2019 09:05:46 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id v201so10572068lfa.11
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 09:05:45 -0800 (PST)
X-Received: by 2002:ac2:5a08:: with SMTP id q8mr21390671lfn.106.1574701545622; 
	Mon, 25 Nov 2019 09:05:45 -0800 (PST)
MIME-Version: 1.0
References: <157225677483.3442.4227193290486305330.stgit@buzz>
	<20191028124222.ld6u3dhhujfqcn7w@box>
	<CAHk-=wgQ-Dcs2keNJPovTb4gG33M81yANH6KZM9d5NLUb-cJ1g@mail.gmail.com>
	<20191028125702.xdfbs7rqhm3wer5t@box>
	<ac83fee6-9bcd-8c66-3596-2c0fbe6bcf96@yandex-team.ru>
	<CAHk-=who0HS=NT8U7vFDT7er_CD7+ZreRJMxjYrRXs5G6dbpyw@mail.gmail.com>
	<f0140b13-cca2-af9e-eb4b-82eda134eb8f@redhat.com>
	<CAHk-=wh4SKRxKQf5LawRMSijtjRVQevaFioBK+tOZAVPt7ek0Q@mail.gmail.com>
	<640bbe51-706b-8d9f-4abc-5f184de6a701@redhat.com>
	<CAHpGcM+o2OwXdrj+A2_OqRg6YokfauFNiBJF-BQp0dJFvq_BrQ@mail.gmail.com>
	<22f04f02-86e4-b379-81c8-08c002a648f0@redhat.com>
In-Reply-To: <22f04f02-86e4-b379-81c8-08c002a648f0@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 25 Nov 2019 09:05:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=whRuPkm7zFUiGe_BXkLvEdShZGngkb=uRufgU65ogCxfg@mail.gmail.com>
Message-ID: <CAHk-=whRuPkm7zFUiGe_BXkLvEdShZGngkb=uRufgU65ogCxfg@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-MC-Unique: -KaQP4o2MjqAwtAoI7v3Lg-1
X-MC-Unique: LE_WskRoPmysrgrKQd3XNg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAPH5tnW026373
X-loop: cluster-devel@redhat.com
Cc: Steve French <sfrench@samba.org>,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	=?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 2:53 AM Steven Whitehouse <swhiteho@redhat.com> wro=
te:
>
> Linus, is that roughly what you were thinking of?

So the concept looks ok, but I don't really like the new flags as they
seem to be gfs2-specific rather than generic.

That said, I don't _gate_ them either, since they aren't in any
critical code sequence, and it's not like they do anything really odd.

I still think the whole gfs2 approach is broken. You're magically ok
with using stale data from the cache just because it's cached, even if
another client might have truncated the file or something.

So you're ok with saying "the file used to be X bytes in size, so
we'll just give you this data because we trust that the X is correct".

But you're not ok to say "oh, the file used to be X bytes in size, but
we don't want to give you a short read because it might not be correct
any more".

See the disconnect? You trust the size in one situation, but not in another=
 one.

I also don't really see that you *need* the new flag at all. Since
you're doing to do a speculative read and then a real read anyway, and
since the only thing that you seem to care about is the file size
(because the *data* you will trust if it is cached), then why don't
you just use the *existing* generic read, and *IFF* you get a
truncated return value, then you go and double-check that the file
hasn't changed in size?

See what I'm saying? I think gfs2 is being very inconsistent in when
it trusts the file size, and I don't see that you even need the new
behavior that patch gives, because you might as well just use the
existing code (just move the i_size check earlier, and then teach gfs2
to double-check the "I didn't get as much as I expected" case).

                 Linus


