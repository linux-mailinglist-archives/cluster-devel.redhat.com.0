Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 59F2A10B47A
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Nov 2019 18:30:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574875826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5hxj8Ip59Gn7t7hOQAf7DDEX8VG4rvDcNKUqF1uGJpU=;
	b=PEk4sClg1EuQBJqahl1CasErbYcUYY+yREEcSKU5mDzwaBg+9YXP7hiIhK1VNbe+nabSC7
	I23Q5/yYQsS8K0uTGb79wOuyMyU8faL+gTiECZKY8XpaN/thu/sfNnL6Ao0DQj/slF7RJy
	MIc1i2FXjKs8QwkfgJ0n4bhn874DNiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-5yLH-E_3PfaZa45bawrQWw-1; Wed, 27 Nov 2019 12:30:24 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C8B6911B3;
	Wed, 27 Nov 2019 17:30:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5BC3608BB;
	Wed, 27 Nov 2019 17:30:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56C034BB65;
	Wed, 27 Nov 2019 17:30:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xARHUCHE011538 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Nov 2019 12:30:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C3245109938; Wed, 27 Nov 2019 17:30:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEB42109945
	for <cluster-devel@redhat.com>; Wed, 27 Nov 2019 17:30:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 668F08023BB
	for <cluster-devel@redhat.com>; Wed, 27 Nov 2019 17:30:08 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-G9MApDpfO4272zU1wmm32Q-1; Wed, 27 Nov 2019 12:30:06 -0500
Received: by mail-lj1-f196.google.com with SMTP id j6so16371345lja.2
	for <cluster-devel@redhat.com>; Wed, 27 Nov 2019 09:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OHYvN6viznScLuFMhHh+plwLnzseinfGUfKYa/O5B9E=;
	b=gk0N4GqG9RnHiRkqnS74cCGbkEhXVM7ceeezhhcF890y/fK1MGL89grrB0SU6L/d2s
	hEuj382zWWfPYdiLnNIyXlrYhaGMuaDzPSDIdZxlPk9fDIfugEJfO636L3brZh+/lXwv
	bk4KQUcTwn8XuMIoREiStIghUtxfBtft0PagC89/KuJLZy8mKdugS1fHbCm+oNF8eCT1
	zJLzjxPk5IJpubztiu0ZP1pBUQYU6XfYCzZD8hqvVG3KeOY8e0yBPfIPinhVOYe4VKjZ
	u58qc1MUUgWES8KfouF0fYNM9PjuP7O/+as3Y0TkM+AQMVh5xnvQo9qb4sCE4J9Eb5yw
	guxw==
X-Gm-Message-State: APjAAAUS8IIMk6EjbV/X4qFAY793gzUXiuSHJLSihX4XLnHwz7sdbvJA
	vHcz4Ww6eRHCPBayZaCTsFyxr2re5TA=
X-Google-Smtp-Source: APXvYqydLJGZhAAVUtTUueMlgabJyiMxi8xg7gtg45yGHwcnng5kPIWr5RD0JJpFPg44gIpT3rIHDg==
X-Received: by 2002:a2e:905a:: with SMTP id n26mr29921869ljg.165.1574875803181;
	Wed, 27 Nov 2019 09:30:03 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
	[209.85.208.181])
	by smtp.gmail.com with ESMTPSA id l8sm7517387ljj.96.2019.11.27.09.30.01
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 27 Nov 2019 09:30:01 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id g3so25337842ljl.11
	for <cluster-devel@redhat.com>; Wed, 27 Nov 2019 09:30:01 -0800 (PST)
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr17881292ljj.97.1574875800695; 
	Wed, 27 Nov 2019 09:30:00 -0800 (PST)
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
	<CAHk-=whRuPkm7zFUiGe_BXkLvEdShZGngkb=uRufgU65ogCxfg@mail.gmail.com>
	<cdd48a4d-42a4-dd15-2701-e08e26fef17f@redhat.com>
In-Reply-To: <cdd48a4d-42a4-dd15-2701-e08e26fef17f@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Nov 2019 09:29:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh5yeAj47x5EAuec7NCgFyYV1VtB9A+nBq+bVP9HmeepQ@mail.gmail.com>
Message-ID: <CAHk-=wh5yeAj47x5EAuec7NCgFyYV1VtB9A+nBq+bVP9HmeepQ@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-MC-Unique: G9MApDpfO4272zU1wmm32Q-1
X-MC-Unique: 5yLH-E_3PfaZa45bawrQWw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xARHUCHE011538
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2019 at 7:42 AM Steven Whitehouse <swhiteho@redhat.com> wro=
te:
>
> I'll leave the finer details to Andreas here, since it is his patch, and
> hopefully we can figure out a good path forward.

As mentioned, I don't _hate_ that patch (ok, I seem to have typoed it
and said that I don't "gate" it ;), so if that's what you guys really
want to do, I'm ok with it. But..

I do think you already get the data with the current case, from the
"short read" thing. So just changing the current generic read function
to check against the size first:

  --- a/mm/filemap.c
  +++ b/mm/filemap.c
  @@ -2021,9 +2021,9 @@ static ssize_t
generic_file_buffered_read(struct kiocb *iocb,
        unsigned int prev_offset;
        int error =3D 0;

  -     if (unlikely(*ppos >=3D inode->i_sb->s_maxbytes))
  +     if (unlikely(*ppos >=3D inode->i_size))
                return 0;
  -     iov_iter_truncate(iter, inode->i_sb->s_maxbytes);
  +     iov_iter_truncate(iter, inode->i_size);

        index =3D *ppos >> PAGE_SHIFT;
        prev_index =3D ra->prev_pos >> PAGE_SHIFT;

and you're done. Nice and clean.

Then in gfs2 you just notice the short read, and check at that point.
Sure, you'll also cut read-ahead to the old size boundary, but does
anybody _seriously_ believe that read-ahead matters when you hit the
"some other node write more data, we're reading past the old end"
case? I don't think that's the case.

But I _can_ live with the patch that adds the extra "cached only" bit.
It just honestly feels pointless.

               Linus


