Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A19686335BB
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Nov 2022 08:13:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669101196;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=10BjkhMSoW3U2bUGh0N+e/mWSGo0zobvSPy084Dj9BQ=;
	b=LctYAe/dEisqNe6ALWndN4AzpMNzQk/5BuTN66plXWPV/pyGWunj0Oz+Qx4RiDawahQRm8
	Q0p/TEE+vucTTshu9KwkKqBh74d1xMKcJ8MWlCBxEhelkkG7ROTMjTvvQb9iR55LEqaO9V
	R3nGWcVqkdxSIOBioHE/tSpaJYZ+9nY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-0wRkrkg0OQ2kTSUhLTWuBA-1; Tue, 22 Nov 2022 02:13:12 -0500
X-MC-Unique: 0wRkrkg0OQ2kTSUhLTWuBA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5D4E185A7A8;
	Tue, 22 Nov 2022 07:13:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC9214B3FC6;
	Tue, 22 Nov 2022 07:13:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6FD6E194658F;
	Tue, 22 Nov 2022 07:13:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F9431946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Nov 2022 07:13:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E453840C6FA2; Tue, 22 Nov 2022 07:13:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD43040C6FA0
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 07:13:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C22C485A5A6
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 07:13:09 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-12-62OHQznMPgqPKK69yAe9_Q-1; Tue, 22 Nov 2022 02:13:07 -0500
X-MC-Unique: 62OHQznMPgqPKK69yAe9_Q-1
Received: by mail-oi1-f173.google.com with SMTP id n186so14965727oih.7
 for <cluster-devel@redhat.com>; Mon, 21 Nov 2022 23:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=10BjkhMSoW3U2bUGh0N+e/mWSGo0zobvSPy084Dj9BQ=;
 b=fR9fFn1I6mZSCo8ja/0Cwm3pAR1JG/rlG9QwO36l72/nG+b3zrf4BSxF7Md0lDY5Bb
 iPhV45ekAum8kkHqm6WlcwaS0XuapeaSffFvHuACeWrDPXX3hUgoo/JTx2S17hoLKVRi
 ZrrQjkoyrxIbib92Ae4gt1Q9nyWM3KirywT9FNnwdKWb9DZHzQSbwm0OBqP3jHVqgx4t
 cFNOLfeWxqj2I89NK7n1vVb0WcdtKyzJ2GZzVy+820QyEt0QnPNN+GmC2YmeOaz//oY0
 xteEr4shg2qQD9enVxBE5FpLb558+yIGU8Lxwk4Y0hq508BMpJQB0zwzgO3vIo5V5SCS
 gTKQ==
X-Gm-Message-State: ANoB5plv4YpIYngq2YHWFSW9tSM3wXjnsMrpIOiE8Iown1SbDOm8h1RX
 /Q0/1iuC5jPJVQeq9CYu/7iP0dlHwjPJCfmLjZKQwcDN8zPOUA==
X-Google-Smtp-Source: AA0mqf4geafsJBx57KC9nW9HQ4zgwi/eHXhTeMgKKI74g9eXx4OqQNsH/1CqxiROB1z7sy3NpPw80n7ggOmcETXvAyE=
X-Received: by 2002:a05:6808:1115:b0:359:cb71:328b with SMTP id
 e21-20020a056808111500b00359cb71328bmr10640723oih.282.1669101186975; Mon, 21
 Nov 2022 23:13:06 -0800 (PST)
MIME-Version: 1.0
References: <CAO4mrfd4=HRXMrcdZQUorNaFss3AFfrRxuXWMFT3uh+Dvfwb9g@mail.gmail.com>
 <CAO4mrfdU4oGktM8PPFg66=32N0JSGx=gtG80S89-b66tS3NLVw@mail.gmail.com>
 <CAO4mrfftfwBWbt-a1H3q559jtnv93MQ92kp=DFnA+-pRrSObcw@mail.gmail.com>
 <CACT4Y+Zub=+V3Yx=wSagYYeybwhbBt66COyTc=OjFAMOibybxg@mail.gmail.com>
 <Y3xmSbsjoMRnRIEd@casper.infradead.org>
In-Reply-To: <Y3xmSbsjoMRnRIEd@casper.infradead.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 22 Nov 2022 08:12:54 +0100
Message-ID: <CACT4Y+YCqrvj-Z46bQiOe-iHzt8CFvk3XZ-Zt4CSGOSshGg0oA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] BUG: unable to handle kernel NULL pointer
 dereference in gfs2_evict_inode
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
Cc: cluster-devel@redhat.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, Wei Chen <harperchen1110@gmail.com>,
 linux-fsdevel@vger.kernel.org, syzkaller@googlegroups.com,
 viro@zeniv.linux.org.uk
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Nov 2022 at 07:03, Matthew Wilcox <willy@infradead.org> wrote:
> > > Dear Linux developers,
> > >
> > > The bug persists in upstream Linux v6.0-rc5.
> >
> > If you fix this, please also add the syzbot tag:
> >
> > Reported-by: syzbot+8a5fc6416c175cecea34@syzkaller.appspotmail.com
> > https://lore.kernel.org/all/000000000000ab092305e268a016@google.com/
>
> Hey Dmitri, does Wei Chen work with you?  They're not responding to
> requests to understand what they're doing.  eg:
>
> https://lore.kernel.org/all/YtVhVKPAfzGmHu95@casper.infradead.org/
>
> https://lore.kernel.org/all/Y0SAT5grkUmUW045@casper.infradead.org/
>
> I'm just ignoring their reports now.

No, I know nothing about this.

