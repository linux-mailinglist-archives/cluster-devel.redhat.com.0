Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4F61419AC22
	for <lists+cluster-devel@lfdr.de>; Wed,  1 Apr 2020 14:55:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585745708;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=c3gbbzAg4lwJ2swAD53d3k1nUZwomngtnjf5t6vMOuQ=;
	b=AwgOvewJMraH5xSebe4fofxbbxN7BJj5HsQUak3wzUH8jqhWeO7mL14w5UXs+gPp7LLS97
	crA1YNNdRuENFvRiorRi8RGiaz8pKqkjLpIc+A5iKYog1pMEJVh2wY3EE0SHJfoa/S4A1r
	dcwfy+HpbZDcM92M9k9ZkXtDgZ61V00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-_jCH_Pt5OjqPbYpp0-mjbw-1; Wed, 01 Apr 2020 08:54:44 -0400
X-MC-Unique: _jCH_Pt5OjqPbYpp0-mjbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CBA7801E74;
	Wed,  1 Apr 2020 12:54:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C7531001B07;
	Wed,  1 Apr 2020 12:54:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74AA418089C8;
	Wed,  1 Apr 2020 12:54:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 031CsYAF000847 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 1 Apr 2020 08:54:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5461999DFF; Wed,  1 Apr 2020 12:54:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FCEE99DFE
	for <cluster-devel@redhat.com>; Wed,  1 Apr 2020 12:54:31 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C20318095FF
	for <cluster-devel@redhat.com>; Wed,  1 Apr 2020 12:54:31 +0000 (UTC)
Date: Wed, 1 Apr 2020 08:54:31 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <696060565.20042254.1585745671511.JavaMail.zimbra@redhat.com>
In-Reply-To: <460174117.20042248.1585745666370.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.79, 10.4.195.16]
Thread-Topic: Linus has pulled our GFS2 patches
Thread-Index: 0ivULMdP4x0gya7R+juCqtaJdo5LMw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] FYI: Linus has pulled our GFS2 patches
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Linus has merged our GFS2 patches into his master branch.

Regards,

Bob Peterson

