Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E08542D9967
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 15:06:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607954765;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LEEuANYn26nu+Qwck3yVjYfgfSr2QO90qdfB7ZnwFbc=;
	b=FKBgSFPbjRigmy1aheDh3w/FZWq8qWqsQNLE6oyOqlkjXgQUGBo4pgLKlPjWx2qz0AWLUn
	RIqLvMKRojFbLgoDcziwSLwHuLkiscdTq8oHMin0FuO6jvkUBeETYXpsnsTTma7xy1LVwl
	0WBCSqoE+15aLCbx4xzWY0/VrCnFTYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465--iEqWDm5N0-HHWJdtTcXUQ-1; Mon, 14 Dec 2020 09:06:00 -0500
X-MC-Unique: -iEqWDm5N0-HHWJdtTcXUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00AF81005504;
	Mon, 14 Dec 2020 14:05:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3E5A5D6D5;
	Mon, 14 Dec 2020 14:05:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA7EF4BB7B;
	Mon, 14 Dec 2020 14:05:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BEE5FeJ017085 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 09:05:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3A22C60C05; Mon, 14 Dec 2020 14:05:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5030B60BE2;
	Mon, 14 Dec 2020 14:05:14 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
References: <20201214085442.45467-1-agruenba@redhat.com>
	<20201214085442.45467-8-agruenba@redhat.com>
	<921985709.35517993.1607954538874.JavaMail.zimbra@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <fb8e0eab-75af-105e-8059-0d7c053f9477@redhat.com>
Date: Mon, 14 Dec 2020 14:05:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <921985709.35517993.1607954538874.JavaMail.zimbra@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 07/12] gfs2: Get rid of on-stack
 transactions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 14/12/2020 14:02, Bob Peterson wrote:
> Hi,
>
> ----- Original Message -----
>> +	ret = __gfs2_trans_begin(sdp, 0, revokes, GFP_NOFS | __GFP_NOFAIL);
> The addition of __GFP_NOFAIL means that this operation can now block.
> Looking at the code, I don't think it will be a problem because it can
> already block in the log_flush operations that precede it, but it
> makes me nervous. Obviously, we need to test this really well.
>
> Bob
>
Not sure of the context here exactly, but why are we adding an instance 
of __GFP_NOFAIL? There is already a return code there so that we can 
fail in that case if required,

Steve.


