Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 773316ED21A
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 18:08:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682352508;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PMM5KNfZCH4SJN4ODWS7ZOiqDGB7ny9+kjv4ifTC/GE=;
	b=V1dSyv5LRavG+xGEAWaV6JJ8LRdDa0Cj5mzLSqWVfZVYl//TKugU8L4fZj21+YwV7fdVda
	UtQ5Vi1WW7YgKPCEmAvPrhVHgG+wdLEnc6zHEpUUeLT7n7Gua5Vr9XSSbJq2VdGRKJDPci
	EcRPqmq+HTFlv/tVWzLy4rBFxqWxIfU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-y9qEbKO7MR-t5Neazj18PA-1; Mon, 24 Apr 2023 12:08:17 -0400
X-MC-Unique: y9qEbKO7MR-t5Neazj18PA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48D8D857F81;
	Mon, 24 Apr 2023 16:08:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 051B210DF8;
	Mon, 24 Apr 2023 16:08:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9F22A194658F;
	Mon, 24 Apr 2023 16:08:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8EFAD1946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 16:08:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 99F652027045; Mon, 24 Apr 2023 16:08:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9296A2027043
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 16:08:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7639F29AB3FF
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 16:08:10 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-nV8lABTTMT6ed6jK7Sm87Q-1; Mon, 24 Apr 2023 12:08:08 -0400
X-MC-Unique: nV8lABTTMT6ed6jK7Sm87Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-5ef6c09fa0dso25836166d6.0
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 09:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682352487; x=1684944487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PMM5KNfZCH4SJN4ODWS7ZOiqDGB7ny9+kjv4ifTC/GE=;
 b=eMLGQI4PMwZjy6hz+yGNjkxxo3fVA8QNJdOg6DlaDZAf+5rlst9tN75lH7tfVN+cV4
 EwjvvkYd3P6fqL6EJgMXvf9YLGfh7zj5AaEwN2Y8Jvxc4kNK+LKgiDBtkganluDa8gpr
 EKgfPjEgZXJQIbYiBCUI3zf3E4cdfS0FJmM/MX47ANbv50h0QsNMS7ckysscidI2CV4J
 DUbEl6DKxsEJGq0u9Z1ulawXYNxAM72IsTwjHi/w9omJlrCMF1vNaof8ZDpOMXEkJ/kl
 MX2Ca6o8Ewb1ERPMeNzwWdAlxF966JPx4ngb+fx7O7EjDnVoh2wL9Zr9iQbTgsmqJiRK
 7TRQ==
X-Gm-Message-State: AAQBX9dN36ZD8ykquZXZShq4zYRDy8/pQ471LSpmVkpT38chUs1fxUrO
 4f5BE3s6rLYyr6qFaEz8kXaMCJcJl1JLemKDR6Vnxmal0/4lDJ2CXRrprP4MXFQwRnOKBkK6GB+
 bkOH6SpB+RVKYegfiYk3ZHkq+DV9t5g==
X-Received: by 2002:a05:6214:dce:b0:5ce:7b40:89bd with SMTP id
 14-20020a0562140dce00b005ce7b4089bdmr27045234qvt.18.1682352487546; 
 Mon, 24 Apr 2023 09:08:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZcYf3cpkOWNFit3a6uAKrCht0zlVPBDHITVb29PnBFCJ8AEoHxgjtMQxY0FIa80EXUSuoRdQ==
X-Received: by 2002:a05:6214:dce:b0:5ce:7b40:89bd with SMTP id
 14-20020a0562140dce00b005ce7b4089bdmr27045211qvt.18.1682352487306; 
 Mon, 24 Apr 2023 09:08:07 -0700 (PDT)
Received: from ?IPV6:2601:883:c200:210:6ae9:ce2:24c9:b87b?
 ([2601:883:c200:210:6ae9:ce2:24c9:b87b])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a0cc989000000b005eee320b5d7sm3385159qvk.63.2023.04.24.09.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:08:06 -0700 (PDT)
Message-ID: <7965740a-b8fc-210b-7b00-feb69683ac3e@redhat.com>
Date: Mon, 24 Apr 2023 12:08:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20230421190710.397684-1-rpeterso@redhat.com>
 <20230421190710.397684-3-rpeterso@redhat.com>
 <CAHc6FU5z1T7+XpDKr3jPxNnG7FtgWxw-gaHi+QvXZUQp-+s_9A@mail.gmail.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <CAHc6FU5z1T7+XpDKr3jPxNnG7FtgWxw-gaHi+QvXZUQp-+s_9A@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [GFS2 PATCH 2/4] gfs2: Perform second log flush
 in gfs2_make_fs_ro
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/23 10:08 AM, Andreas Gruenbacher wrote:
>> point the GFS2_LOG_HEAD_FLUSH_SHUTDOWN has been set by gfs2_make_fs_ro.
> 
> Do you mean that at that point, the SDF_JOURNAL_LIVE flag has already
> been cleared?

Ah, yes, you are correct. That was a think-o. Please adjust as appropriate.

Regards,

Bob Peterson

