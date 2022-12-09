Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5751364826B
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Dec 2022 13:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670589457;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kKcc7XQPg0UZn1AHNfQ4N2d5zF9JzBW3g3hPGFAB4Kc=;
	b=cun6SHJzcrZ4qpXDhQ/aV1OHbicHKdNf8T8VOLImf+5eRa1XzlHYJSbOcmBEBW9LOQhPAk
	Zl6YFKeW+FSUW14Us6rmOFHMGJvCd4BD8o5NtAXr1XK1/n2yXD67uoIDbmb7NQ4eMKgBJE
	ttgvyClvVAfgQNsHgpahfhlOhWgx+pY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-ISzTdxYVMqCBMeHJSfyRNQ-1; Fri, 09 Dec 2022 07:37:26 -0500
X-MC-Unique: ISzTdxYVMqCBMeHJSfyRNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75E5429ABA33;
	Fri,  9 Dec 2022 12:37:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B76B1401C30;
	Fri,  9 Dec 2022 12:37:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C107B1946A7E;
	Fri,  9 Dec 2022 12:37:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 23EAE1946A72 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  9 Dec 2022 12:37:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 85DC340C6EC6; Fri,  9 Dec 2022 12:37:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DF8040C6EC3
 for <cluster-devel@redhat.com>; Fri,  9 Dec 2022 12:37:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 626211C05AF7
 for <cluster-devel@redhat.com>; Fri,  9 Dec 2022 12:37:15 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-CMV1gZ_dOECxTBPaM4Nd3w-1; Fri, 09 Dec 2022 07:37:14 -0500
X-MC-Unique: CMV1gZ_dOECxTBPaM4Nd3w-1
Received: by mail-wm1-f69.google.com with SMTP id
 v125-20020a1cac83000000b003cfa148576dso2351201wme.3
 for <cluster-devel@redhat.com>; Fri, 09 Dec 2022 04:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kKcc7XQPg0UZn1AHNfQ4N2d5zF9JzBW3g3hPGFAB4Kc=;
 b=c4+bWJ5d+u71KOs0PZqg6k7ztIkFPg+3SUhmn2yYKAAp8lT9iDrpgyWL3SZyc8fNsS
 JKDSFYJsCSwHSzigqly6eB0oXmjJjM7ycMn+YFsKkTVOjfTWqwjhogemVJyFOijf3CMM
 YiIjs6Bp6aaHr5tX657wKpStodKmb+trpO+6Vdz7EyiHwbL8PeYQhmqO5e3f5x6nE0Cl
 IvhCiqlr0NOyx/SnNVs3mDXZB1MC387WSP1L28pQiU1w2/8FtvHxhlBBdRXa8IEzCBfs
 BD4+sftoyPeJf+pLyGjh/JCZ7ahHGKSKrYx5HPwJDA0LXZqI0H6eB9sIN8fNwxjvLkQ5
 ihaA==
X-Gm-Message-State: ANoB5pm39CH/f5A9KMRkxpJgaXYMTtGEgF5OcZd5o9vG9BuFdeuEtZg4
 OgzdyWlHSOSXvodBGcyPNe5xvervODsn2gXXI/ojK3/891pX/crhN+rDsx9wWfm/RHWqKgRIr+a
 OK9bQUIytOqYJYWb4oXGcdw==
X-Received: by 2002:a05:600c:4fd0:b0:3d1:c0a1:4804 with SMTP id
 o16-20020a05600c4fd000b003d1c0a14804mr4752757wmq.17.1670589432845; 
 Fri, 09 Dec 2022 04:37:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5DyMiYpWNcqaQueb0cVh7tJ5lH4JY75MZjLcmrbwYgfM+x/au0sr5C4m2hvq8cZrZMVyWo5g==
X-Received: by 2002:a05:600c:4fd0:b0:3d1:c0a1:4804 with SMTP id
 o16-20020a05600c4fd000b003d1c0a14804mr4752714wmq.17.1670589432518; 
 Fri, 09 Dec 2022 04:37:12 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-106-22.dyn.eolo.it.
 [146.241.106.22]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c1c0a00b003b49bd61b19sm9284355wms.15.2022.12.09.04.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 04:37:11 -0800 (PST)
Message-ID: <d220402a232e204676d9100d6fe4c2ae08f753ee.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Benjamin Coddington <bcodding@redhat.com>, netdev@vger.kernel.org
Date: Fri, 09 Dec 2022 13:37:08 +0100
In-Reply-To: <c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
References: <cover.1669036433.git.bcodding@redhat.com>
 <c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v1 2/3] Treewide: Stop corrupting
 socket's task_frag
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, samba-technical@lists.samba.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, linux-nvme@lists.infradead.org,
 Philipp Reisner <philipp.reisner@linbit.com>,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Eric Dumazet <edumazet@google.com>, linux-nfs@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Mike Christie <michael.christie@oracle.com>,
 drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
 Sagi Grimberg <sagi@grimberg.me>, linux-scsi@vger.kernel.org,
 Mark Fasheh <mark@fasheh.com>, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, Jakub Kicinski <kuba@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, open-iscsi@googlegroups.com,
 Anna Schumaker <anna@kernel.org>, Eric Van Hensbergen <ericvh@gmail.com>,
 "James
 E.J. Bottomley" <jejb@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 nbd@other.debian.org, linux-block@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>, v9fs-developer@lists.sourceforge.net,
 Keith Busch <kbusch@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Chris Leech <cleech@redhat.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>,
 Christoph =?ISO-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Chuck Lever <chuck.lever@oracle.com>, Lee Duncan <lduncan@suse.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2022-11-21 at 08:35 -0500, Benjamin Coddington wrote:
> Since moving to memalloc_nofs_save/restore, SUNRPC has stopped setting the
> GFP_NOIO flag on sk_allocation which the networking system uses to decide
> when it is safe to use current->task_frag.  The results of this are
> unexpected corruption in task_frag when SUNRPC is involved in memory
> reclaim.
> 
> The corruption can be seen in crashes, but the root cause is often
> difficult to ascertain as a crashing machine's stack trace will have no
> evidence of being near NFS or SUNRPC code.  I believe this problem to
> be much more pervasive than reports to the community may indicate.
> 
> Fix this by having kernel users of sockets that may corrupt task_frag due
> to reclaim set sk_use_task_frag = false.  Preemptively correcting this
> situation for users that still set sk_allocation allows them to convert to
> memalloc_nofs_save/restore without the same unexpected corruptions that are
> sure to follow, unlikely to show up in testing, and difficult to bisect.
> 
> CC: Philipp Reisner <philipp.reisner@linbit.com>
> CC: Lars Ellenberg <lars.ellenberg@linbit.com>
> CC: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
> CC: Jens Axboe <axboe@kernel.dk>
> CC: Josef Bacik <josef@toxicpanda.com>
> CC: Keith Busch <kbusch@kernel.org>
> CC: Christoph Hellwig <hch@lst.de>
> CC: Sagi Grimberg <sagi@grimberg.me>
> CC: Lee Duncan <lduncan@suse.com>
> CC: Chris Leech <cleech@redhat.com>
> CC: Mike Christie <michael.christie@oracle.com>
> CC: "James E.J. Bottomley" <jejb@linux.ibm.com>
> CC: "Martin K. Petersen" <martin.petersen@oracle.com>
> CC: Valentina Manea <valentina.manea.m@gmail.com>
> CC: Shuah Khan <shuah@kernel.org>
> CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CC: David Howells <dhowells@redhat.com>
> CC: Marc Dionne <marc.dionne@auristor.com>
> CC: Steve French <sfrench@samba.org>
> CC: Christine Caulfield <ccaulfie@redhat.com>
> CC: David Teigland <teigland@redhat.com>
> CC: Mark Fasheh <mark@fasheh.com>
> CC: Joel Becker <jlbec@evilplan.org>
> CC: Joseph Qi <joseph.qi@linux.alibaba.com>
> CC: Eric Van Hensbergen <ericvh@gmail.com>
> CC: Latchesar Ionkov <lucho@ionkov.net>
> CC: Dominique Martinet <asmadeus@codewreck.org>
> CC: "David S. Miller" <davem@davemloft.net>
> CC: Eric Dumazet <edumazet@google.com>
> CC: Jakub Kicinski <kuba@kernel.org>
> CC: Paolo Abeni <pabeni@redhat.com>
> CC: Ilya Dryomov <idryomov@gmail.com>
> CC: Xiubo Li <xiubli@redhat.com>
> CC: Chuck Lever <chuck.lever@oracle.com>
> CC: Jeff Layton <jlayton@kernel.org>
> CC: Trond Myklebust <trond.myklebust@hammerspace.com>
> CC: Anna Schumaker <anna@kernel.org>
> CC: drbd-dev@lists.linbit.com
> CC: linux-block@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: nbd@other.debian.org
> CC: linux-nvme@lists.infradead.org
> CC: open-iscsi@googlegroups.com
> CC: linux-scsi@vger.kernel.org
> CC: linux-usb@vger.kernel.org
> CC: linux-afs@lists.infradead.org
> CC: linux-cifs@vger.kernel.org
> CC: samba-technical@lists.samba.org
> CC: cluster-devel@redhat.com
> CC: ocfs2-devel@oss.oracle.com
> CC: v9fs-developer@lists.sourceforge.net
> CC: netdev@vger.kernel.org
> CC: ceph-devel@vger.kernel.org
> CC: linux-nfs@vger.kernel.org
> 
> Suggested-by: Guillaume Nault <gnault@redhat.com>
> Signed-off-by: Benjamin Coddington <bcodding@redhat.com>

I think this is the most feasible way out of the existing issue, and I
think this patchset should go via the networking tree, targeting the
Linux 6.2.

If someone has disagreement with the above, please speak! 

Thanks,

Paolo

