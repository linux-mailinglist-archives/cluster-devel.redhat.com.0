Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7ED435AD2
	for <lists+cluster-devel@lfdr.de>; Thu, 21 Oct 2021 08:22:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292--9TUoFI9PGK7WOHGgEu6Kg-1; Thu, 21 Oct 2021 02:22:17 -0400
X-MC-Unique: -9TUoFI9PGK7WOHGgEu6Kg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 789AC80668B;
	Thu, 21 Oct 2021 06:22:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4E406911D;
	Thu, 21 Oct 2021 06:22:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76FAB180BAD1;
	Thu, 21 Oct 2021 06:22:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19L6K5f6019369 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 02:20:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A41C2166B2D; Thu, 21 Oct 2021 06:20:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 653902166B25
	for <cluster-devel@redhat.com>; Thu, 21 Oct 2021 06:20:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 952EB899EC5
	for <cluster-devel@redhat.com>; Thu, 21 Oct 2021 06:20:02 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-470-H_f64Y0EMUSeIAlXydyZbA-1; Thu, 21 Oct 2021 02:20:00 -0400
X-MC-Unique: H_f64Y0EMUSeIAlXydyZbA-1
Received: by mail-lf1-f45.google.com with SMTP id x27so321111lfu.5
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 23:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ySym1S+xM/vLmh5qD50mQk6IKKZnZMjSymPhRc8AKZU=;
	b=M4ED92EJuupJUCJr1SYkV2Iu/+zF051ESzlba08GoBds4hgr3npYnTKWls7p0BihfP
	nhJDiF/U3ciqnDOGLTuQDsfMloN7xl1K2W0Q9InKfY+wSScv9HmjoqhDlTPlF4GiAbJK
	l/OL6D3Jd1aTCrei25ytF9Fc6qMjIW52NNFQwVv95933Cl1f0WrHzBDb0/46+FgRsktS
	4VQfR6iIvloiN7w1cHDV31k+DyrfSYdk0EpWJT4P23eOP89fc9hhf5RAUZFjqlSyg8IT
	xbgID6DswYxDwUcP1uieM89QY7xbZf+XLNSD0lO6vzEIhhiJ89PznU693BK/Qh6HLf25
	hzLQ==
X-Gm-Message-State: AOAM532kzRoHkPBIw63YmNDte3aM5cdy1fWlu8XxY38W+iavTfSEWrvF
	z5879KGTXeW+ONwu94zvD4qadxI4ngRp2kI9EyE=
X-Google-Smtp-Source: ABdhPJxR7vGoXSPojspFbpQBkB6Yeb6STkeNSTD181zAYTNn1SkCTQ+LGR3sgiDcl7JI3P6wbgVJMg==
X-Received: by 2002:ac2:5469:: with SMTP id e9mr3734815lfn.466.1634797198442; 
	Wed, 20 Oct 2021 23:19:58 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
	[209.85.167.54]) by smtp.gmail.com with ESMTPSA id
	k37sm370910lfv.304.2021.10.20.23.19.56 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 20 Oct 2021 23:19:57 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id y15so198760lfk.7
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 23:19:56 -0700 (PDT)
X-Received: by 2002:a19:ad0c:: with SMTP id t12mr3576075lfc.173.1634797196615; 
	Wed, 20 Oct 2021 23:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
In-Reply-To: <YXCbv5gdfEEtAYo8@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 20 Oct 2021 20:19:40 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
Message-ID: <CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
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
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 00/17] gfs2: Fix mmap + page fault
	deadlocks
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

On Wed, Oct 20, 2021 at 12:44 PM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> However, with MTE doing both get_user() every 16 bytes and
> gup can get pretty expensive.

So I really think that anything that is performance-critical had
better only do the "fault_in_write()" code path in the cold error path
where you took a page fault.

IOW, the loop structure should be


     repeat:
                take_locks();
                pagefault_disable();
                ret = do_things_with_locks();
                pagefault_enable();
                release_locks();

                // Failure path?
                if (unlikely(ret == -EFAULT)) {
                        if (fault_in_writable(..))
                                goto repeat;
                        return -EFAULT;
                }

rather than have it be some kind of "first do fault_in_writable(),
then do the work" model.

So I wouldn't worry too much about the performance concerns. It simply
shouldn't be a common or hot path.

And yes, I've seen code that does that "fault_in_xyz()" before the
critical operation that cannot take page faults, and does it
unconditionally.

But then it isn't the "fault_in_xyz()" that should be blamed if it is
slow, but the caller that does things the wrong way around.

            Linus

