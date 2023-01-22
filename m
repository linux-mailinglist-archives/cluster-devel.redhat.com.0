Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 26979677235
	for <lists+cluster-devel@lfdr.de>; Sun, 22 Jan 2023 21:06:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674417996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=M3P+Sxuip0JpXG7+ldpgmEp2EenukjcoZIDETYOhkzk=;
	b=VxJ9skZNxRmUs/Gib5a3eqJW5RdUZ47lMmpUL7+ytjzzTnyYJf+3T86yO/f674udtdB3/L
	kPVz5Q54NQ0wk0RpvhuxJq6FTPJxh4YiGTcvl20yWSKJ7i46J/K66CbBL18/68Yedvw4iK
	FImS3gHrczn4nZ6vcX/MiSNrwD7idrE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-eOd-rtF9MhSQTF8nYgZzrA-1; Sun, 22 Jan 2023 15:06:33 -0500
X-MC-Unique: eOd-rtF9MhSQTF8nYgZzrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C4C085A588;
	Sun, 22 Jan 2023 20:06:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35DB62166B32;
	Sun, 22 Jan 2023 20:06:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E1B641946589;
	Sun, 22 Jan 2023 20:06:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 45A331946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 20:06:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B6F2C492B03; Sun, 22 Jan 2023 20:06:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF873492B02
 for <cluster-devel@redhat.com>; Sun, 22 Jan 2023 20:06:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94F47802BF3
 for <cluster-devel@redhat.com>; Sun, 22 Jan 2023 20:06:13 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-zhsK76q9NkWzw5x2Zc8Mxg-1; Sun, 22 Jan 2023 15:06:11 -0500
X-MC-Unique: zhsK76q9NkWzw5x2Zc8Mxg-1
Received: by mail-qt1-f176.google.com with SMTP id e8so8293067qts.1
 for <cluster-devel@redhat.com>; Sun, 22 Jan 2023 12:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M3P+Sxuip0JpXG7+ldpgmEp2EenukjcoZIDETYOhkzk=;
 b=OysoIvtFQizLiZCLA8BY8xatonPPByFGAhYuVhkhhRgS+UXJx27WGB8mMmVvYdrYWx
 bgJPl5Kt+KaINBha/rs6ZnbVQKGXSzcof64uHE9a7RdZisYzIJdVg0jDYLklGmhwa73h
 Ki+z1zd04EA/Pk2Iym7Lb/KkpuDR7oGOMtbfgAMj6OFnhh9R7QI4Vny2v6DVZtFcT0Zg
 wCMSfv7OjXsPRt8BgZTsFaIZXFTKJ1BKF88XybI+5+A1G89AL3ybhtOWO6j2PTwsjitW
 z35+kLt2vb7IaMp8nt6yivmMOgXt9MUBpVcST/7/6YxmM2rSpeW8OLq/jcsjEh2cjxEQ
 b1Cg==
X-Gm-Message-State: AFqh2kpB63gF/gTzm5R76nXP/Rxo8ayytutxGafTRDlzHP9Hr8JPEGft
 sUmnhe4NlfVlpuYYQhZP9ddr0NNIMjNDFFun
X-Google-Smtp-Source: AMrXdXuyOJm9OuKEIGDgiwKYQ4RNwKv5ngJc3BgC/fEfVBV8MBJ5qXE6lCYlT31pWk7A8H3dYJ/Xvw==
X-Received: by 2002:ac8:5513:0:b0:3a9:8c90:dcec with SMTP id
 j19-20020ac85513000000b003a98c90dcecmr30815820qtq.68.1674417970762; 
 Sun, 22 Jan 2023 12:06:10 -0800 (PST)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com.
 [209.85.222.179]) by smtp.gmail.com with ESMTPSA id
 t2-20020a37ea02000000b006fb9bbb071fsm30106227qkj.29.2023.01.22.12.06.10
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 12:06:10 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id p22so5439668qkm.0
 for <cluster-devel@redhat.com>; Sun, 22 Jan 2023 12:06:10 -0800 (PST)
X-Received: by 2002:a05:620a:99d:b0:705:efa8:524c with SMTP id
 x29-20020a05620a099d00b00705efa8524cmr1089614qkx.594.1674417969782; Sun, 22
 Jan 2023 12:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20230122090115.1563753-1-agruenba@redhat.com>
In-Reply-To: <20230122090115.1563753-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Jan 2023 12:05:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgjMNbNG0FMatHtmzEZPj0ZmQpNRsnRvH47igJoC9TBww@mail.gmail.com>
Message-ID: <CAHk-=wgjMNbNG0FMatHtmzEZPj0ZmQpNRsnRvH47igJoC9TBww@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
 David Howells <dhowells@redhat.com>, 
 Steve French <smfrench@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>,
 Jan Kara <jack@suse.cz>, 
 Trond Myklebust <trondmy@hammerspace.com>, Christoph Hellwig <hch@lst.de>, 
 "Darrick J. Wong" <djwong@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 writepage fix
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
Cc: cluster-devel@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 22, 2023 at 1:01 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> gfs2 writepage fix
>
> - Fix a regression introduced by commit "gfs2: stop using
>   generic_writepages in gfs2_ail1_start_one".

Hmm. I'm adding a few more people and linux-fsdevel to the reply,
because we had a number of filesystems remove writepages use lately,
including some that did it as a fix after the merge window.

Everybody involved seemed to claim it was just a no-brainer
switch-over, and I just took that on faith. Now it looks like that
wasn't true at least for gfs2 due to different semantics.

Maybe the gfs2 issue is purely because of how gfs2 did the conversion
(generic_writepages -> filemap_fdatawrite_wbc), but let's make people
look at their own cases.

                 Linus

