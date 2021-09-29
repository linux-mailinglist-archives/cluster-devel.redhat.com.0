Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 75FCD41C5A3
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Sep 2021 15:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632922173;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9cuW/BEIb+6X1ZevXCqIH6JlF8lHfRGaO8H4WfB7/ME=;
	b=dis2IVKNK7NqLNcOA4J361MVkpYcbqfYUIG6ol94+OWeYCoXhtxKxKScBYcKbGnUR5KNlN
	mz8GeaDE0EUXtvM2H71l2sPjwiKnItaASzSyKanYPDyaOEQYHV9g2yGH9pH7JoiaMFT+C1
	ia4u64UTKyerJ2RPx1heMT/Hg3+lzoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-FgUrdhtvMV2_k4CwNRjp7A-1; Wed, 29 Sep 2021 09:29:32 -0400
X-MC-Unique: FgUrdhtvMV2_k4CwNRjp7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25E21801B3D;
	Wed, 29 Sep 2021 13:29:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15A145C1C5;
	Wed, 29 Sep 2021 13:29:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 157B84E58F;
	Wed, 29 Sep 2021 13:29:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18TDS0mK029111 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 29 Sep 2021 09:28:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B337910F8E3B; Wed, 29 Sep 2021 13:28:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AED96100905A
	for <cluster-devel@redhat.com>; Wed, 29 Sep 2021 13:27:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C7CE811E76
	for <cluster-devel@redhat.com>; Wed, 29 Sep 2021 13:27:55 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-400-qAvFDUaQNbKhYbOAjpFBLQ-1; Wed, 29 Sep 2021 09:27:54 -0400
X-MC-Unique: qAvFDUaQNbKhYbOAjpFBLQ-1
Received: by mail-io1-f70.google.com with SMTP id
	g8-20020a05660203c800b005d58875129eso3014674iov.2
	for <cluster-devel@redhat.com>; Wed, 29 Sep 2021 06:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:from:to:references:in-reply-to
	:content-transfer-encoding;
	bh=9cuW/BEIb+6X1ZevXCqIH6JlF8lHfRGaO8H4WfB7/ME=;
	b=rS/tVOcW2GGe6HOhGiW5Fi6Hm2n1IPw29gWGw4agq+YpUMUOKh4LtR5LQr+crIUf6r
	BP4rsKu+iI7piblyDEuq+TK6KjTFwMaiWm6T1jporZpvAlZTG+YyHDiPELgA9uPAKWQ2
	5mOu8SzVvatDQ22CEVXcfD//18oQCE0VJAnyKXfBCcabA7Kgqov5kZPA1KlxecEY7bZ6
	6FI2+SJozoAgvOEVf5IjcyIET94oE5cJ1X/1DsNL7XYSxvLrgjVO0EwP7CUI6Pee9FCO
	GafKw+sUfFHjR3TH5KAui5JbsyTM1SvpEpfIFjKzHXe9xBK7C56zB+qrV7lpekbWqw0u
	kYgA==
X-Gm-Message-State: AOAM531eWGXVf3ujipw5+QeOVMPjFUGSDTDEkcWL8NW/qLnAn/Pb2Qzt
	lTK1qFLkP2VGBmxiYJjXEqtMAJcr6+Pu7k1H7LdNGRRD/RWQqvegY0TTbyVXxtNnhmQ7jJPhzqU
	k3Xcp4gdMdhxhbGXR7f9NXWPBa8x2cLSWmakMlcp9kXgbliF8ofcb88jtI7MDhCu8cmfmCkpiXQ
	==
X-Received: by 2002:a05:6638:4199:: with SMTP id
	az25mr9491601jab.71.1632922073184; 
	Wed, 29 Sep 2021 06:27:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHT5+/XD4VRoNxzPMPKsWQiw0HMIkHWgP5KZUgnArlgmPsi21iR+3S6JHv972Kp4PySbmLjA==
X-Received: by 2002:a05:6638:4199:: with SMTP id
	az25mr9491580jab.71.1632922072868; 
	Wed, 29 Sep 2021 06:27:52 -0700 (PDT)
Received: from [172.16.0.19] ([172.87.10.244])
	by smtp.gmail.com with ESMTPSA id
	p11sm1432095ilh.38.2021.09.29.06.27.51 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 29 Sep 2021 06:27:51 -0700 (PDT)
Message-ID: <6e1f6910-bc37-ae93-0362-dee45c579d14@redhat.com>
Date: Wed, 29 Sep 2021 08:27:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.1.0
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
References: <20210929132103.192481-1-rpeterso@redhat.com>
In-Reply-To: <20210929132103.192481-1-rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: fix GL_SKIP node_scope problems
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/21 8:21 AM, Bob Peterson wrote:
> Before this patch, when a glock was locked, the very first holder on the
> queue would unlock the lockref and call the go_lock glops function (if
> one existed), unless GL_SKIP was specified. When we introduced the new
> node-scope concept, we allowed multiple holders to lock glocks in EX mode
> and share the lock.
> 
> But node-scope introduced a new problem: if the first holder has GL_SKIP
> and the next one does NOT, since it is not the first holder on the queue,
> the go_lock op was not called. Eventually the GL_SKIP holder may call the
> go_lock sub-function (e.g. gfs2_rgrp_bh_get) but there was still a
> window of time in which another non-GL_SKIP holder assumes the go_lock
> function had been called by the first holder. In the case of rgrp glocks,
> this led to a NULL pointer dereference on the buffer_heads.
> 
> This patch tries to fix the problem by introducing two new glock flags:
> 
> GLF_GO_LOCK_NEEDED, which keeps track of when the go_lock function needs
> to be called to "fill in" or "read" the object before it is referenced.
> 
> GLF_GO_LOCK_IN_PROG which is used to determine when a process is
> in the process of reading in the object. Whenever a function needs to
> reference the object, it checks the GLF_GO_LOCK_NEEDED flag, and if
> set, it sets GLF_GO_LOCK_IN_PROG and calls the glops "go_lock" function.
> 
> As before, the gl_lockref spin_lock is unlocked during the IO operation,
> which may take a relatively long amount of time to complete. While
> unlocked, if another process determines go_lock is still needed, it sees
> the GLF_GO_LOCK_IN_PROG flag is set, and waits for the go_lock glop
> operation to be completed. Once GLF_GO_LOCK_IN_PROG is cleared, it needs
> to check GLF_GO_LOCK_NEEDED again because the other process's go_lock
> operation may not have been successful.
> 
> To faciliate this change, the go_lock section of function do_promote
> was extracted to its own new function, gfs2_go_lock. The reason we do
> this is because GL_SKIP callers often read in the object later.
> Before this patch, those GL_SKIP callers (like gfs2_inode_lookup and
> update_rgrp_lvb) called directly into the object-read functions
> (gfs2_inode_refresh and gfs2_rgrp_bh_get respectively), but that never
> cleared the new GLF_GO_LOCK_NEEDED flag. This patch changes those
> functions so they call into the new gfs2_go_lock directly, which takes
> care of all that.
> 
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>   fs/gfs2/glock.c  | 136 +++++++++++++++++++++++++++++++++--------------
>   fs/gfs2/glock.h  |   1 +
>   fs/gfs2/glops.c  |  21 ++++----
>   fs/gfs2/incore.h |   3 +-
>   fs/gfs2/inode.c  |   4 +-
>   fs/gfs2/rgrp.c   |  12 ++---
>   fs/gfs2/super.c  |   6 ++-
>   7 files changed, 121 insertions(+), 62 deletions(-)
(snip)
> @@ -2153,6 +2209,8 @@ static const char *gflags2str(char *buf, const struct gfs2_glock *gl)
>   		*p++ = 'P';
>   	if (test_bit(GLF_FREEING, gflags))
>   		*p++ = 'x';
> +	if (test_bit(GLF_GO_LOCK_NEEDED, gflags))
> +		*p++ = 'g';
>   	*p = 0;
>   	return buf;
>   }

Hi,

As soon as I sent this patch out I realized I forgot to add the second
new GLF bit, GLF_GO_LOCK_IN_PROG, to gflags2str. So the final version
will include it.

Also, this version passed 500 iterations of the failing test case and
a full run of xfstests.

Regards,

Bob Peterson

