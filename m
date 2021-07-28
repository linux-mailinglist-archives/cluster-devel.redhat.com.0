Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8CB3D8F0F
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jul 2021 15:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627479034;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PJc5jHPRQqe2lrGxEyprGCas7oMz/9sFCsfbOyVa0KE=;
	b=irECpq8zbDgD97lDDtwSvijOaKlcTB4Uu/0sMi0lC9EaN9LwnIQtEKYUtAXDqqalXAJpNH
	4YURYzx1DlhzNSlkQAgXDfPTxRw+1Zq7C/jxZ1nop1dCQvwDfu81e+dquiv9RcJVvdq/IL
	Cwo+YZVtY8gXDOIGOTZLuN6eICEYrDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-1_yWL_NvOgC091Z08mMlDw-1; Wed, 28 Jul 2021 09:30:27 -0400
X-MC-Unique: 1_yWL_NvOgC091Z08mMlDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5E1D87D542;
	Wed, 28 Jul 2021 13:30:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C10CB5D6B1;
	Wed, 28 Jul 2021 13:30:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5E88180BAB1;
	Wed, 28 Jul 2021 13:30:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16SDUDqw029712 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 09:30:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58789EE84E; Wed, 28 Jul 2021 13:30:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22E8BEB33E
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 13:30:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2708101A529
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 13:30:10 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-364-FhPn2qQLOxWEt5EUKwpg6g-1; Wed, 28 Jul 2021 09:30:09 -0400
X-MC-Unique: FhPn2qQLOxWEt5EUKwpg6g-1
Received: by mail-io1-f70.google.com with SMTP id
	p7-20020a6b63070000b02904f58bb90366so1724024iog.14
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 06:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PJc5jHPRQqe2lrGxEyprGCas7oMz/9sFCsfbOyVa0KE=;
	b=C+6C/hotz8zzRNFa22+DvtbIrhy0SwoMaSqRqYx91aG2W8mNzrxbJj9wCtAkAxjC45
	Rq5FFqhRzi18Zf8VUmqKGCt/CJuxp24dm6/qBZCctZnNG+htcmuA7nFTv9dMl9o0Riuv
	Dxtimj91v2DCUg50LzGpKfYDYzdQtc65GdgV/utz5fvOeVi1d4vWAgRYCq8kyxMzisrQ
	nQDyEcoDOv3fLp+cUnt/8XROls+f07zeEL8FYt83/7Ro2mxNZv0+RvjifUBFcwe9Mkhn
	5jxBAAm4f6f64wYSaQKIE5ceXrAxYZr/QFERpqUxGDrh6Ysv3Np5q+DJm0YPmfO4CCO7
	JlGg==
X-Gm-Message-State: AOAM531pQWDbvOnG6Nk6MtAW0T1Lnus0tnAG+NeI2kU+T25VVBAL1sYg
	PljwaihB9dbNQbjxlYWqEWx424mKhxUPKmenbZYyl11Nmy+0qDkaf5ptCcs/0V6gD6OlyRovl9A
	aDIRZ1Xbh50nAO9TkwDcb1I/8yJSeeNmpFaO2jGn64xRf4WV9AVM+ssBauxyU6vNIsdZGyn82lg
	==
X-Received: by 2002:a6b:b795:: with SMTP id h143mr23708574iof.74.1627479008257;
	Wed, 28 Jul 2021 06:30:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP4w1S/N1bhmrn50SNvGNeFbn13qwMPItKBJeXEumHI9YVeudSY1UB7NnCmVtz8j9zTBoFQA==
X-Received: by 2002:a6b:b795:: with SMTP id h143mr23708559iof.74.1627479008024;
	Wed, 28 Jul 2021 06:30:08 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id w7sm5024732iox.1.2021.07.28.06.30.07
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 28 Jul 2021 06:30:07 -0700 (PDT)
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
	<20210727173709.210711-10-rpeterso@redhat.com>
	<CAHc6FU5CQgo1wgwANoVetfNhZKGduyLBhS5s6MGTepOgKB9bbA@mail.gmail.com>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <097fc264-fd96-6bc4-eff4-e56fb9ea58ad@redhat.com>
Date: Wed, 28 Jul 2021 08:30:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHc6FU5CQgo1wgwANoVetfNhZKGduyLBhS5s6MGTepOgKB9bbA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 09/15] gfs2: fix deadlock in
 gfs2_ail1_empty withdraw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/28/21 12:38 AM, Andreas Gruenbacher wrote:
> Hi Bob,
> 
> On Tue, Jul 27, 2021 at 7:37 PM Bob Peterson <rpeterso@redhat.com> wrote:
>> Before this patch, function gfs2_ail1_empty could issue a file system
>> withdraw when IO errors were discovered. However, there are several
>> callers, including gfs2_flush_revokes() which holds the gfs2_log_lock
>> before calling gfs2_ail1_empty. If gfs2_ail1_empty needed to withdraw
>> it would leave the gfs2_log_lock held, which resulted in a deadlock
>> due to other processes that needed the log_lock.
>>
>> Another problem discovered by Christoph Helwig is that we cannot
>> withdraw from the log_flush process because it may be called from
>> the glock workqueue, and the withdraw process waits for that very
>> workqueue to be flushed. So the withdraw must be ignored until it may
>> be handled by a more appropriate context like the gfs2_logd daemon.
>>
>> This patch moves the withdraw out of function gfs2_ail1_empty and
>> makes each of the callers check for a withdraw by calling new function
>> check_ail1_withdraw.
> 
>> Function gfs2_flush_revokes now does this check
>> after releasing the gfs2_log_lock to avoid the deadlock.
> 
> I don't see that in the code.

Yeah, the comment was wrong. I noticed the problem and already removed 
the paragraph after the patch set was sent out.

Bob

