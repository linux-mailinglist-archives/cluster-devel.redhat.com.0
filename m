Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A8CBA363E66
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 11:18:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-vEn4xDEYPoS7teWg4LQIcA-1; Mon, 19 Apr 2021 05:18:51 -0400
X-MC-Unique: vEn4xDEYPoS7teWg4LQIcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4A818189C8;
	Mon, 19 Apr 2021 09:18:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F599CA0;
	Mon, 19 Apr 2021 09:18:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B85F3807;
	Mon, 19 Apr 2021 09:18:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13J59bws005389 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 01:09:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 14FAF2ED7E; Mon, 19 Apr 2021 05:09:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FC182ED7D
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 05:09:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBD7480A1D2
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 05:09:33 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-548-ZWfE5i_sNdSu3h9pIqcmsQ-1; Mon, 19 Apr 2021 01:09:29 -0400
X-MC-Unique: ZWfE5i_sNdSu3h9pIqcmsQ-1
Received: by mail-oi1-f171.google.com with SMTP id k25so34337025oic.4
	for <cluster-devel@redhat.com>; Sun, 18 Apr 2021 22:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=fABlF+14BfgwTL8mrmDU7zMG3h8rFyGf7GZuESKF/uo=;
	b=aS15ByugGH3JVzFhBnzP8qm94NChNVv3ohX4TN9OUOMXYQzuwJJ3+tdXAwOr/hmlqM
	jImKezw8MLja/1CgMcntd3H6Uw/gvSYKK9g02h9PmII6o9VPldlUo/AN1nrlRsYNLt4H
	/kCtAgohS5ZNnjRJwHTmFXHOeLyHvlBuBI2ipZpVqDGUmps9MrD9CUIxk26vkjIwoNpl
	wXwZ+EDoBSthoi+CbZdANArR8bmlCjJ9FnldRxaMK+75RkbfxazNXOxMMkQpns6EjC4G
	Pj3D5jcI5qntqszF055UC6PHAid8+Lc+rEbQzjl1EHvfeNLIeGPejsOcKmss/gjCHB/w
	38fw==
X-Gm-Message-State: AOAM532zDi2DnvXU6pBZsUi7pGEYcrHsBnI5VFtLAasFp9Q4G+rBE1Np
	rFSWlYgLIx1Maia9hE5JZ4MoCQ==
X-Google-Smtp-Source: ABdhPJyuYzBsn68fl9VLHc7H54GcpcAV6KleKpLXoBj5CGl6GoWvD7RzUYe+oS5rlv9IZQcBX4jN+w==
X-Received: by 2002:a05:6808:f0a:: with SMTP id
	m10mr15432070oiw.48.1618808968841; 
	Sun, 18 Apr 2021 22:09:28 -0700 (PDT)
Received: from elm (162-237-133-238.lightspeed.rcsntx.sbcglobal.net.
	[162.237.133.238])
	by smtp.gmail.com with ESMTPSA id v81sm42860oie.13.2021.04.18.22.09.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Apr 2021 22:09:28 -0700 (PDT)
Date: Mon, 19 Apr 2021 00:09:26 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20210419050926.GB405651@elm>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210330164458.1625478-1-lee.jones@linaro.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 19 Apr 2021 05:18:38 -0400
Cc: David Howells <dhowells@redhat.com>, Michal Hocko <mhocko@suse.com>,
	Eric Biggers <ebiggers@google.com>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, James Morris <jamorris@linux.microsoft.com>,
	Tycho Andersen <tycho@tycho.pizza>, cluster-devel@redhat.com,
	"Michael A. Halcrow" <mahalcro@us.ibm.com>,
	"Trevor S. Highland" <trevor.highland@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Michael C. Thompsion" <mcthomps@us.ibm.com>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	"Michael A. Halcrow" <mhalcrow@us.ibm.com>
Subject: Re: [Cluster-devel] [PATCH 00/31] Rid W=1 warnings from GFS2 and
	EncryptFS
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

On 2021-03-30 17:44:27, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> There is more to do in filesystems.  Another set will follow.
> 
> Lee Jones (31):
...
>   fs: ecryptfs: read_write: File headers do not make good candidates for
>     kernel-doc
>   fs: ecryptfs: debug: Demote a couple of kernel-doc abuses
>   fs: ecryptfs: dentry: File headers are not good candidates for
>     kernel-doc
>   fs: ecryptfs: kthread: Demote file header and provide description for
>     'cred'
>   fs: ecryptfs: file: Demote kernel-doc abuses
>   fs: ecryptfs: super: Fix formatting, naming and kernel-doc abuses
>   fs: ecryptfs: messaging: Add missing param descriptions and demote
>     abuses
>   fs: ecryptfs: main: Demote a bunch of non-conformant kernel-doc
>     headers
>   fs: ecryptfs: miscdev: File headers are not good kernel-doc candidates
>   fs: ecryptfs: crypto: Supply some missing param descriptions and
>     demote abuses
>   fs: ecryptfs: mmap: Help out one function header and demote other
>     abuses
>   fs: ecryptfs: inode: Help out nearly-there header and demote
>     non-conformant ones
>   fs: ecryptfs: keystore: Fix some kernel-doc issues and demote
>     non-conformant headers

I've applied the eCryptfs fixes to the next branch of
tyhicks/ecryptfs.git. Thanks for the clean-up!

Tyler

